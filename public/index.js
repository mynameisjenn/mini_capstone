/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Game City!"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var ProductsShowPage = {
  template: "#products-show-page",
  data: function() {
    return {
      product: {
                  id: "",
                  name: "",
                  price: "",
                  description: "",
                  images: [ {
                            id: "",
                            url: "",
                            alt: "" 
                            }
                            ],
                  formatted: {
                            price: "",
                            tax: "",
                            total: ""
                            },
                  supplier: {
                            id: "",
                            name: "",
                            email: "",
                            phone_number: "",
                            product_names: [ ]
                          }
                  }
    };
  }, 
  created: function() {
    axios
    .get("api/products/" + this.$route.params.id)
    .then(function(response) {
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {} 
};

var ProductsIndexPage = {
  template: "#products-index-page",
  data: function() {
    return {
      products: [ ]
    };
  },
  created: function() {
    axios
    .get("/api/products")
    .then(function(response) {
      this.products = response.data;
    }.bind(this));

  },
  methods: {},
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      name: "",
      price: "",
      description: "",
      supplier_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        description: this.description,
        supplier_id: this.supplier_id
      };
      axios
        .post("/products", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};


var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "#logout-page",
  data: function() {
    return {
      message: "You have successfully logged out!"
    };
  },
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
  }
};



var router = new VueRouter({
  routes: [
          { path: "/", component: HomePage },
          { path: "/signup", component: SignupPage },
          { path: "/login", component: LoginPage },
          { path: "/logout", component: LogoutPage },
          { path: "/products", component: ProductsIndexPage },
          { path: "/products/new", component: NewProductPage },
          { path: "/products/:id", component: ProductsShowPage }
          ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
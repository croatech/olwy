app.controller('CategoryCtrl', ['categoryService', function(categoryService) {

  function CategoryCtrl() {
    var vm = this;

    vm.getProducts = function() {
      categoryService.getProducts('cat_0').then(function(res) {
        vm.products = nilGuard(res);
        console.log(res);
      });
    }

    vm.getProducts();
  }
}]);
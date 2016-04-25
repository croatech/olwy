(function() {
  'use strict';

  angular
    .module('Owly')
    .factory('cartService', cartService);

  function cartService(Restangular) {
    var service = {
      addToCart    : addToCart,
      getCartCount : getCartCount 
    }

    var baseUrl = 'http://owly.ru/api'

    return service;
    
    function addToCart(productId) {
      return Restangular.oneUrl('cart', baseUrl + '/cart/add/').customPUT({product_id: productId});
    };

    function getCartCount() {
      return Restangular.oneUrl('count', baseUrl + '/cart/count/').get();
    }
  }
})();
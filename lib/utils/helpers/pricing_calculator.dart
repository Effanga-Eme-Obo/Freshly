
class MPricingCalculator{

  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount +shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
  return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    return  0.075;
  }

  static double getShippingCost(String location){
    return 2500.00;
  }

  //static double calculateCartTotal(CartModel cart){
    //return cart.items.map(e => e.price).fold(0, (previousPrice, currentPrice) => previousPrice +(currentPrice ?? 0));
  //}
}
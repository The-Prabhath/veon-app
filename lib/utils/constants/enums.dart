/// LIST OF Enums
/// They cannot be created inside a class.

enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

/// Product type: simple (no variations) or variable (has size/color/etc.)
enum ProductType { simple, variable }

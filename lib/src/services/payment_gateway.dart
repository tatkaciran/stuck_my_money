import 'package:flutter_stripe/flutter_stripe.dart';

abstract class IPayment {
  Future<String> createPayment({
    required String cardNumber,
    required String expMonth,
    required String expYear,
    required String cvc,
  });
}

class PaymentRepository extends IPayment {
  final IPayment _stripePaymentSource;

  PaymentRepository({required IPayment stripePaymentSource})
      : _stripePaymentSource = stripePaymentSource;

  @override
  Future<String> createPayment({
    required String cardNumber,
    required String expMonth,
    required String expYear,
    required String cvc,
  }) {
    return _stripePaymentSource.createPayment(
        cardNumber: cardNumber, expMonth: expMonth, expYear: expYear, cvc: cvc);
  }
}

class StripePaymentSource extends IPayment {
  final String publishableKey;
  final Stripe _stripe;

  StripePaymentSource({required this.publishableKey, Stripe? stripe})
      : _stripe = stripe ?? Stripe.instance;

  @override
  Future<String> createPayment({
    required String cardNumber,
    required String expMonth,
    required String expYear,
    required String cvc,
  }) async {
    return "";
  }

  void createPaymentMethod() {
    Address shippingDetailsAddress = const Address(
      city: "city",
      country: "country",
      line1: "line1",
      line2: "line2",
      postalCode: "postalCode",
      state: "state",
    );
    PaymentIntentsFutureUsage setupFutureUsage =
        PaymentIntentsFutureUsage.OnSession;
    PaymentMethodOptions options =
        PaymentMethodOptions(setupFutureUsage: setupFutureUsage);
    BillingDetails billingDetails = const BillingDetails();
    ShippingDetails shippingDetails =
        ShippingDetails(address: shippingDetailsAddress);
    var paymentMethodData = PaymentMethodData(
      billingDetails: billingDetails,
      shippingDetails: shippingDetails,
    );
    var params = PaymentMethodParams.card(paymentMethodData: paymentMethodData);
    _stripe.createPaymentMethod(params: params, options: options);
  }
}

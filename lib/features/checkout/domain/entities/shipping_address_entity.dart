class ShippingAddressEntity {
  final String name;
  final String address;
  final String phone;
  final String city;
  final String email;
  final String addressDetails;

  ShippingAddressEntity(
      {required this.name,
      required this.address,
      required this.phone,
      required this.city,
      required this.email,
      required this.addressDetails});
}

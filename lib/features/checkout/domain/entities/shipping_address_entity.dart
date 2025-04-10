class ShippingAddressEntity {
  String? name;
  String? address;
  String? phone;
  String? city;
  String? email;
  String? floor;

  ShippingAddressEntity({
    this.name,
    this.address,
    this.phone,
    this.city,
    this.floor,
    this.email,
  });
  @override
  String toString() {
    // TODO: implement toString
    return "$address $floor $city";
  }
}

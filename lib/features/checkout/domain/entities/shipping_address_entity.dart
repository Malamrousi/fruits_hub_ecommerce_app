class ShippingAddressEntity {
   String? name;
   String? address;
   String? phone;
   String? city;
   String? email;
   String? addressDetails;
   String? floor;

  ShippingAddressEntity(
      {this.name,
      this.address,
      this.phone,
      this.city,
      this.floor,
      this.email,
      this.addressDetails});
}

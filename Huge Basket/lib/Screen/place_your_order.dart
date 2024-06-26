import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_27_03/Cutom/Button/custom_radio.dart';
import 'package:task_27_03/Cutom/Button/full_button_custom.dart';
import 'package:task_27_03/Utils/AppColor.dart';
import 'package:task_27_03/route_setting.dart';

class PlaceYourOrder extends StatefulWidget {
  const PlaceYourOrder({super.key});

  @override
  State<PlaceYourOrder> createState() => _PlaceYourOrderState();
}

class _PlaceYourOrderState extends State<PlaceYourOrder> {
  int selectedAddressIndex = 0;
  int selectedPaymentIndex = 0;

  int total = 0;
  double tac = 5.0;
  double service = 0.0;
  double device = 0.0;
  double promo = 3.0;

  @override
  Widget build(BuildContext context) {
    var subTotal = ModalRoute.of(context)!.settings.arguments as double;

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.grey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 6,
                blurRadius: 6,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColor.white,
            title: const Text(
              'Place Your Order',
              style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new)),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 45,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: AppColor.greenLight200,
                boxShadow: [
                  BoxShadow(
                      color: AppColor.greenLightShadow200,
                      spreadRadius: 6,
                      blurRadius: 10)
                ]),
            child: const Center(
              child: Text(
                'Next delivery on Wed, 14 Nov 2020',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primary),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.only(bottom: 13, left: 20, right: 20),
              width: double.infinity,
              decoration:
                  const BoxDecoration(color: AppColor.white, boxShadow: [
                BoxShadow(
                  color: AppColor.greyShadow,
                  blurRadius: 6,
                  offset: Offset(0, 0),
                )
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter code here",
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none),
                        ),
                        DottedBorder(
                          dashPattern: const [3, 3],
                          padding: const EdgeInsets.all(0),
                          color: AppColor.grey200,
                          borderType: BorderType.Oval,
                          child: Container(),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Apply',
                    style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  )
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
              BoxShadow(
                color: AppColor.greyShadow,
                blurRadius: 6,
                offset: Offset(0, 0),
              )
            ]),
            child: Column(
              children: [
                PriceList(title: 'Sub Total', price: subTotal),
                PriceList(title: 'Tac', price: tac),
                PriceList(
                  title: 'Service Fee',
                  price: service,
                  lessPrice: 2.00,
                ),
                PriceList(
                  title: 'Device Fee',
                  price: device,
                  lessPrice: 3.00,
                ),
                const Divider(
                  color: AppColor.grey,
                ),
                PriceList(
                  price: subTotal + tac + service + device,
                  boldText: true,
                ),
                PriceList(
                  price: promo,
                  promo: 'Promo Applied (OFF20%)',
                ),
                PriceList(
                    price: (subTotal + tac + service + device) - promo,
                    title: 'Total Amount',
                    boldText: true),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          // shipping
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
              BoxShadow(
                color: AppColor.greyShadow,
                blurRadius: 6,
                offset: Offset(0, 0),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: Text('Shipping'),
                ),
                Divider(
                  height: 1,
                  color: AppColor.black.withOpacity(0.2),
                ),
                Column(
                    children: List.generate(
                  2,
                  (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAddressIndex = index;
                        });
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        decoration: const BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.greyShadow,
                                blurRadius: 6,
                                offset: Offset(0, 0),
                              )
                            ]),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                CustomRadioAddress(
                                  isSelected: index == selectedAddressIndex,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Flexible(
                                  child: Text(
                                    "799 Lost Creek Road,Seattle , Fort Washington, Us, 19034 $index",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.textaddress),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      )),
                )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15),
                    child: NavigateNewManage(
                        newontap: () {
                          Navigator.pushNamed(context, MyRouter.add_address);
                        },
                        manageontap: () {
                          Navigator.pushNamed(context, MyRouter.manage_address);
                        },
                        newTitle: 'Add New',
                        manageTitle: 'Manage Address')),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
              BoxShadow(
                color: AppColor.greyShadow,
                blurRadius: 6,
                offset: Offset(0, 0),
              )
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                  child: Text('Payment information'),
                ),
                Divider(
                  height: 1,
                  color: AppColor.black.withOpacity(0.2),
                ),
                Column(
                    children: List.generate(
                  1,
                  (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPaymentIndex = index;
                        });
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        decoration: const BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.greyShadow,
                                blurRadius: 6,
                                offset: Offset(0, 0),
                              )
                            ]),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa.png',
                                  width: 40,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Anthony Bailey",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.textaddress),
                                      ),
                                      Text(
                                        "•••• •••• •••• 5678",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.textaddress),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      )),
                )),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15),
                    child: NavigateNewManage(
                        newontap: () {
                          Navigator.pushNamed(context, MyRouter.add_address);
                        },
                        manageontap: () {
                          Navigator.pushNamed(context, MyRouter.manage_address);
                        },
                        newTitle: 'Add New',
                        manageTitle: 'Change Card')),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
            child: CustomFullButton(ontap: () {}, title: 'Place Order'),
          )
        ],
      ),
    );
  }
}

class NavigateNewManage extends StatelessWidget {
  final Function newontap;
  final Function manageontap;
  final String newTitle;
  final String manageTitle;

  const NavigateNewManage({
    super.key,
    required this.newontap,
    required this.manageontap,
    required this.newTitle,
    required this.manageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            newontap();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 22,
                width: 22,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColor.primary, width: 2)),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    color: AppColor.primary,
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                newTitle,
                style: const TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            manageontap();
          },
          child: Text(
            manageTitle,
            style: const TextStyle(
                color: AppColor.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class PriceList extends StatelessWidget {
  final String? title;
  final double price;
  final double? lessPrice;
  final String? promo;
  final bool? boldText;

  const PriceList(
      {super.key,
      this.title,
      required this.price,
      this.lessPrice,
      this.promo,
      this.boldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
      child: Row(
        children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    '$title',
                    style: TextStyle(
                        fontSize: 16,
                        color: boldText == true
                            ? AppColor.black
                            : AppColor.grey500,
                        fontWeight: FontWeight.w500),
                  ),
                )
              : const SizedBox(),
          promo != null
              ? Text(
                  '$promo',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColor.grey500,
                      fontWeight: FontWeight.w500),
                )
              : const SizedBox(),
          title != null && promo == null && boldText != true
              ? const Icon(
                  Icons.info_outline,
                  size: 14,
                  color: AppColor.greyPlaceText,
                )
              : const SizedBox(),
          const Spacer(),
          lessPrice != null
              ? Text('\$ $lessPrice',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize: 16,
                      color: AppColor.grey500,
                      fontWeight: FontWeight.w500))
              : const Text(''),
          lessPrice != null
              ? const SizedBox(
                  width: 10,
                )
              : const SizedBox(),
          promo != null
              ? const Text(
                  '-',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w700),
                )
              : const SizedBox(),
          promo != null
              ? const SizedBox(
                  width: 5,
                )
              : const SizedBox(),
          Text('\$ $price',
              style: TextStyle(
                  fontSize: 16,
                  color: promo != null
                      ? Colors.red
                      : boldText == true
                          ? AppColor.black
                          : AppColor.grey500,
                  fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}

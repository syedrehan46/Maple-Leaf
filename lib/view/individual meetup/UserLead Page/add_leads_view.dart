import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import '../../../controller/IM/Individual Painter/all_paniter_detail_controller.dart';
import '../../../model/IM/indivdual_painter_model.dart';

class AddLeadsView extends StatefulWidget {
  final String? title;
  final IndivdualPainterModel? painter;

  const AddLeadsView({super.key, this.title, this.painter});

  @override
  State<AddLeadsView> createState() => _AddLeadsViewState();
}

class _AddLeadsViewState extends State<AddLeadsView> {
  final TextEditingController customerNameEditingController = TextEditingController();
  final TextEditingController customerNumberEditingController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  final AllPaniterDetailController allPainterController = Get.put(AllPaniterDetailController());

  String selectedLocation = '';

  @override
  void initState() {
    super.initState();
    customerNameEditingController.text = widget.painter?.painterName ?? '';
    customerNumberEditingController.text = widget.painter?.phoneNumber ?? '';
  }

  void openLocationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            List<String> dialogFilteredLocations = searchController.text.isEmpty
                ? List.from(allPainterController.areaNameList)
                : allPainterController.areaNameList
                .where((item) => item.toLowerCase().contains(searchController.text.toLowerCase()))
                .toList();

            return Dialog(
              backgroundColor: AppColors.whiteColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SizedBox(
                height: 450,
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select Item',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: searchController,
                        onChanged: (_) => setDialogState(() {}),
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          isDense: true,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Expanded(
                        child: dialogFilteredLocations.isEmpty
                            ? const Center(child: Text("No results found"))
                            : ListView.builder(
                          itemCount: dialogFilteredLocations.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    dialogFilteredLocations[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedLocation = dialogFilteredLocations[index];
                                    });
                                    searchController.clear();
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(height: 1, color: Colors.grey),
                              ],
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton.icon(
                          onPressed: () {
                            searchController.clear();
                            Navigator.pop(context);
                          },
                          label: const Text(
                            'CLOSE',
                            style: TextStyle(
                              color: AppColors.redColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(Icons.close, color: AppColors.redColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: CustomAppbar(title: widget.title ?? "Add lead")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        widget.title ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        label: "Enter Customer Name and Password",
                        controller: customerNameEditingController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                        label: "Enter Customer Number",
                        controller: customerNumberEditingController,
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "  * Areas",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: openLocationDialog,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F5F5),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedLocation.isEmpty ? "Please Select Area" : selectedLocation,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          ),
                          onPressed: () {},
                          child: const Text(
                            "Add Lead",
                            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? keyboardType;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLength,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = "* ${widget.label}";

    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: !_focusNode.hasFocus ? displayText : null,
        labelStyle: const TextStyle(color: Color(0xff504E4E)),
        labelText: _focusNode.hasFocus ? displayText : null,
        counterText: "",
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){Get.back();},
            child: const Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: const GradientBoxBorder(width: 2, gradient: LinearGradient(colors: [Colors.blue, Colors.red]),)
                  ),
                  child: Container(
                    height: 110,
                    width: 110,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset("assets/images/profileImage.png")
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                      color: Colors.white,
                      iconSize: 24,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Syed Sabih',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            Expanded(child: ListView(
              children: [
                _buildTextField('Your Email', 'sabih@gmail.com', const Icon(Icons.email_outlined)),
                _buildTextField('Phone Number', '+923452212211', const Icon(Icons.phone)),
                _buildTextField('Career', 'Developer', const Icon(Icons.laptop)),
                _buildTextField('Address', 'Pakistan', const Icon(Icons.location_on)),
                const SizedBox(height: 32),
                Container(
                  height: 50,
                  width: 1000,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(colors: [Color.fromRGBO(0, 133, 255, 1), Color.fromRGBO(0, 52, 101, 1)]),
                  ),
                  child: const Center(child: Text('Save Changes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                ),
              ],
            )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, Icon icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
          const SizedBox(height: 8,),
          TextField(
            style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
              prefixIconColor: Colors.grey,
              prefixIcon: icon,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
            ),
            controller: TextEditingController()..text = initialValue,
          ),
        ],
      ),
    );
  }
}
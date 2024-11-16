import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Stories
  final RxList<Map<String, String>> stories = [
    {"name": "Your Story", "image": "assets/images/mine.png"},
    {"name": "Selena", "image": "assets/images/girl1.png"},
    {"name": "Clara", "image": "assets/images/clara.png"},
    {"name": "Fabian", "image": "assets/images/fabian.png"},
    {"name": "George", "image": "assets/images/fabian.png"},
  ].obs;

  // Categories
  final RxList<Map<String, String>> items = [
    {"color": "0xFFE57373", "text": "Meeting"},
    {"color": "0xFF81C784", "text": "Hangout"},
    {"color": "0xFF64B5F6", "text": "Cooking"},
    {"color": "0xFFFFB74D", "text": "Other"},
    {"color": "0xFFBA68C8", "text": "Weekend"},
  ].obs;

  // Frequently Used Items
  final RxList<Map<String, String>> frequentlyUsedItems = [
    {
      "color": "0xFF9575CD",
      "text": "Caller IDt",
      "image": "assets/images/Filled.svg"
    },
    {
      "color": "0xFF4DB6AC",
      "text": "Credit Champ",
      "image": "assets/images/Filled 2.svg"
    },
    {
      "color": "0xFFF06292",
      "text": "Bank Transfer",
      "image": "assets/images/Group.svg"
    },
    {
      "color": "0xFFFFA726",
      "text": "Request Money",
      "image": "assets/images/Vector.svg"
    },
    {
      "color": "0xFFA724",
      "text": "Transaction History",
      "image": "assets/images/Chart.svg"
    },
  ].obs;

  // Financial Services
  final RxList<Map<String, String>> financialServicesItem = [
    {
      "color": "0xFF4DB6AC",
      "text": "Credit Champ",
      "image": "assets/images/Filled 2.svg"
    },
    {
      "color": "0xFF9575CD",
      "text": "Caller ID",
      "image": "assets/images/Filled.svg"
    },
    {
      "color": "0xFFFFA726",
      "text": "Request Money",
      "image": "assets/images/Vector.svg"
    },
    {
      "color": "0xFFF06292",
      "text": "Bank Transfer",
      "image": "assets/images/Group.svg"
    },
    {
      "color": "0xFFA724",
      "text": "Transaction History",
      "image": "assets/images/Chart.svg"
    },
  ].obs;

  // Helper function to lighten a color
  Color lightenColor(Color color, [double amount = 0.3]) {
    return Color.alphaBlend(
      Colors.white.withOpacity(amount),
      color,
    );
  }
}

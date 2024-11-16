import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPinController extends GetxController {
  // Observable variables
  var pin = List.filled(4, '').obs; // List to store the entered PIN digits
  var currentPinIndex = 0.obs; // Current index for the PIN box

  // Function to handle number button presses
  void onNumberButtonPressed(String number) {
    if (currentPinIndex.value < pin.length) {
      pin[currentPinIndex.value] = number; // Update the current pin box
      currentPinIndex.value++; // Move to the next pin box
    }
  }

  // Function to handle backspace
  void onBackspacePressed() {
    if (currentPinIndex.value > 0) {
      currentPinIndex.value--; // Move back to the previous pin box
      pin[currentPinIndex.value] = ''; // Clear the current pin box
    }
  }

  // Function to reset PIN
  void resetPin() {
    pin.value = List.filled(4, ''); // Reset all PIN digits
    currentPinIndex.value = 0; // Reset index
  }

}
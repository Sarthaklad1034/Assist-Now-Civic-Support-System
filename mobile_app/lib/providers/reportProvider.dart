
import 'dart:io';
import 'package:flutter/material.dart';
import '../models/issueModel.dart';
import '../service/mediaService.dart';
import '../service/speechToTextService.dart';
import '../service/locationService.dart';
import 'package:fluttertoast/fluttertoast.dart';

class reportProvider extends ChangeNotifier {
  final LocationService _locationService;
  final speechToTextService _speechService;
  final mediaService _mediaService;

  reportProvider(
      this._locationService,
      this._speechService,
      this._mediaService,
      );

  final IssueModel _issue = IssueModel();
  IssueModel get issue => _issue;

  final List<IssueModel> _issues = [];
  List<IssueModel> get issues => _issues;

  bool _isSubmitting = false;
  bool get isSubmitting => _isSubmitting;

  bool _isGettingLocation = false;
  bool get isGettingLocation => _isGettingLocation;

  bool _isListening = false;
  bool get isListening => _isListening;

  String? _error;
  String? get error => _error;

  // Photo
  Future<void> pickFromCamera() async {
    _error = null;
    final File? file = await _mediaService.pickFromCamera();
    if (file != null) {
      _issue.photo = file;
      notifyListeners();
    }
  }

  Future<void> pickFromGallery() async {
    _error = null;
    final File? file = await _mediaService.pickFromGallery();
    if (file != null) {
      _issue.photo = file;
      notifyListeners();
    }
  }

  void removePhoto() {
    _issue.photo = null;
    notifyListeners();
  }

  // Location
  Future<void> refreshLocation() async {
    _error = null;
    _isGettingLocation = true;
    notifyListeners();
    try {
      final pos = await _locationService.getPosition();
      final addr = await _locationService.reverseGeocode(
        pos.latitude,
        pos.longitude,
      );
      _issue.lat = pos.latitude;
      _issue.lng = pos.longitude;
      _issue.address = addr;
    } catch (e) {
      _error = 'Failed to get location: $e';
      Fluttertoast.showToast(
        msg: _error!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    } finally {
      _isGettingLocation = false;
      notifyListeners();
    }
  }

  (double?, double?) giveLocation() {
    return (_issue.lat, _issue.lng);
  }

  // Description
  void setDescription(String value) {
    _issue.description = value;
    notifyListeners();
  }

  // Speech - FIXED VERSION
  Future<void> toggleListen(TextEditingController controller) async {
    if (_isListening) {
      // Stop listening
      await _speechService.stop();
      _isListening = false;
      notifyListeners();
      return;
    }

    // Initialize speech service first
    final initialized = await _speechService.init();
    if (!initialized) {
      _error = 'Speech recognition not available on this device';
      Fluttertoast.showToast(
        msg: _error!,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
      );
      notifyListeners();
      return;
    }

    // Start listening
    _isListening = true;
    _error = null;
    notifyListeners();

    await _speechService.listen(
      onResult: (text) {
        // Update the text field with recognized speech
        controller.text = text;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        setDescription(text);
      },
      onDone: () {
        _isListening = false;
        notifyListeners();
        Fluttertoast.showToast(
          msg: 'Speech recognition completed',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      },
      onError: (err) {
        _isListening = false;
        _error = 'Speech error: $err';
        notifyListeners();
        Fluttertoast.showToast(
          msg: _error!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
        );
        debugPrint("Speech error: $err");
      },
    );
  }

  // Category
  void setCategory(String cat) {
    _issue.category = cat;
    notifyListeners();
  }

  // Priority
  void setPriority(IssuePriority? p) {
    _issue.priority = p;
    notifyListeners();
  }
  Future<void> reset() async {
    _issue.photo=null;
    _issue.description="";
    _issue.priority=null;
    _issue.address="";
    _issue.category="";
  }
  // Submit
  Future<bool> submit() async {
    _error = null;

    if (_issue.description == null || _issue.description!.trim().isEmpty) {
      _error = 'Please describe the issue.';
      notifyListeners();
      return false;
    }
    if (_issue.address == null || _issue.lat == null || _issue.lng == null) {
      _error = 'Please fetch your current location.';
      notifyListeners();
      return false;
    }
    if (_issue.photo == null) {
      _error = 'Please upload a photo of the issue.';
      notifyListeners();
      return false;
    }
    if (_issue.category == null || _issue.category!.trim().isEmpty) {
      _error = 'Please select a category.';
      notifyListeners();
      return false;
    }
    if (_issue.priority == null) {
      _error = 'Please set a priority.';
      notifyListeners();
      return false;
    }

    _isSubmitting = true;
    notifyListeners();

    try {
      await _issue.submit();

      Fluttertoast.showToast(
        msg: "Issue submitted successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      _issue.raisedDate = DateTime.now();
      _issue.status = "Submitted";

      // Add a copy of the issue to the list
      _issues.add(
        IssueModel(
          photo: _issue.photo,
          description: _issue.description,
          priority: _issue.priority,
          lat: _issue.lat,
          lng: _issue.lng,
          address: _issue.address,
          category: _issue.category,
          raisedDate: _issue.raisedDate,
          status: _issue.status,
        ),
      );

      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      Fluttertoast.showToast(
        msg: "Submission failed: $_error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _speechService.dispose();
    super.dispose();
  }
}
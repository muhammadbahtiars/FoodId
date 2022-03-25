import 'package:flutter/material.dart';

class SearchFormInput extends StatelessWidget {
  final Function() onPressed;
  final TextEditingController searchInput;

  // ignore: use_key_in_widget_constructors
  const SearchFormInput({
    required this.onPressed,
    required this.searchInput,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      color: const Color(0xFF2ecc71),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 30,
      ),
      child: Material(
        elevation: 2.0,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(20.0),
        child: TextFormField(
          controller: searchInput,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
          keyboardType: TextInputType.text,
          onEditingComplete: () {
            onPressed();
            FocusScope.of(context).requestFocus(FocusNode());
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Mau belanja makanan apa ?',
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 5.0),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

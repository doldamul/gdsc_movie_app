import 'package:flutter/material.dart';
import 'package:gdsc_movie_app/constants/sizes.dart';

class CommonInputWidget extends StatefulWidget {
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final String? value;
  final EdgeInsets padding;

  const CommonInputWidget({
    super.key,
    this.onSubmit,
    this.onChange,
    this.value,
    this.padding = const EdgeInsets.only(left: Sizes.size20),
  });

  @override
  State<StatefulWidget> createState() => _CommonInputWidgetState();
}

class _CommonInputWidgetState extends State<CommonInputWidget> {
  late TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant CommonInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    var value = _controller.value.text;
    if (value.isEmpty) return;

    if (widget.onSubmit != null) {
      widget.onSubmit!(value);
    }
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: _controller,
      focusNode: _focusNode,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      onEditingComplete: _onSubmit,
      onChanged: widget.onChange,
      textInputAction: TextInputAction.search,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: '영화를 검색해보세요!',
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        suffixIcon: IconButton(
          onPressed: _onSubmit,
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        contentPadding: widget.padding,
        border: InputBorder.none,
      ),
      cursorColor: Colors.blue.shade400,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
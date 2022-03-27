import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'inherited_media.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      backgroundColor: Colors.grey.shade100,
      onSubmitted: (value) {
        InheritedMedia
            .of(context)
            .viewModel
            .mediaProvider
            .fetchingMusic(
          term: value,
        );
      },
      placeholder: 'search media',
    );
  }
}

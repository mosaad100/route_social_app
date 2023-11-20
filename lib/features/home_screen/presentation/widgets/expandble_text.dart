import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMoreTextWidget extends StatefulWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final String showMoreText;
  final String showLessText;

  const ShowMoreTextWidget({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 3,
    this.showMoreText = 'Show more',
    this.showLessText = 'Show less',
  });

  @override
  _ShowMoreTextWidgetState createState() => _ShowMoreTextWidgetState();
}

class _ShowMoreTextWidgetState extends State<ShowMoreTextWidget> {
  bool _showMore = false;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(text: widget.text, style: widget.style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      maxLines: _showMore ? null : widget.maxLines,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final isTextOverflowing = textPainter.didExceedMaxLines;

    return GestureDetector(
      onTap: isTextOverflowing || _showMore
          ? () {
              setState(() {
                _showMore = !_showMore;
              });
            }
          : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: textSpan,
            maxLines: _showMore ? 100 : widget.maxLines,
            overflow: TextOverflow.ellipsis,
          ),
          if (isTextOverflowing || _showMore)
            Text(_showMore ? widget.showLessText : widget.showMoreText,
                style: widget.style.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp)),
        ],
      ),
    );
  }
}

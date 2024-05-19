import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/theme/palette.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: 40,
          child: TextField(
            style: const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
              filled: true,
              fillColor: Palette.authTextFieldFillColor,
              hintText: "Ara",
              hintStyle: GoogleFonts.inter(fontSize: 14),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1622557245950107648/jq2sqW7i_400x400.jpg',
                  ),
                ),
                const SizedBox(width: 10), // Boşluk ekledim
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Text(
                                    "@berketurktr",
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Palette.usernameGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            AssetConstants.threeDotsOption,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "BERKE TÜRK",
                            style: GoogleFonts.cabin(fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              "Takip Ediyorsun",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Palette.usernameGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:technicmate/constants/constants.dart';
import 'package:technicmate/features/feed/model/feed_model.dart';
import 'package:technicmate/theme/theme.dart';

class SharingView extends StatelessWidget {
  const SharingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (context, index) => const Divider(
            color: Palette.seperatorGrey,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                    flex: 2,
                                    child: Text(
                                      "muhterem",
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 5), // Boşluk ekledim
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      "recep",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Palette.usernameGrey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5), // Boşluk ekledim
                                  Flexible(
                                    child: Text(
                                      "•5Dk",
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
                        const SizedBox(height: 5), // Boşluk ekledim

                        Text(
                          "Texts",
                          style: GoogleFonts.cabin(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),

                        const SizedBox(height: 10),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              "https://pbs.twimg.com/media/GNyYwBeWYAAzq6f?format=jpg&name=4096x4096",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle; // e.g. "430 W | 22.3% Efficiency"
  final String price; // e.g. "₹280"
  final String oldPrice; // e.g. "₹350"
  final Color cardColor; // panel background (dark green)
  final Color accentColor; // highlight (green)

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.oldPrice,
    this.cardColor = const Color(0xFF163826),
    this.accentColor = const Color(0xFF38A169),
  });

  @override
  Widget build(BuildContext context) {
    // card width can be fixed when used in horizontal list, or allowed to expand in Grid
    return Container(
      width: 200, // adjust or remove for flexible layouts
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 8, offset: const Offset(0, 6))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Material(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image block
              SizedBox(
                height: 110,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, st) => Container(color: Colors.white12, alignment: Alignment.center, child: const Icon(Icons.broken_image, color: Colors.white70)),
                ),
              ),

              // Info panel that visually overlaps the image boundary (the ClipRRect takes care of corners)
              Container(
                color: cardColor,
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),

                    const SizedBox(height: 6),

                    // Subtitle/specs line
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.white.withOpacity(0.85), fontSize: 12),
                    ),

                    const SizedBox(height: 12),

                    // Price row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          oldPrice,
                          style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 12, decoration: TextDecoration.lineThrough),
                        ),
                        const Spacer(),
                        // small pill badge optionally

                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class RefurbishedCard extends StatelessWidget {
  final String imagePath;
  final String title;          // e.g. 'LG NeON 2 (Used)'
  final String specLine;       // e.g. '430 W | 22.3% Efficiency'
  final String batteryHealth;  // e.g. '98% Battery Health'
  final String price;          // e.g. '\$150'
  final String priceLabel;     // e.g. 'Per Panel'
  final Color cardColor;
  final Color accentColor;
  final bool showUsedBadge;
  final VoidCallback? onTap;

  const RefurbishedCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.specLine,
    required this.batteryHealth,
    required this.price,
    this.priceLabel = 'Per Panel',
    this.cardColor = const Color(0xFF163826),
    this.accentColor = const Color(0xFF38A169),
    this.showUsedBadge = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200, // tweak for desired size (200 matches your screenshot proportions)
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Top image
                SizedBox(
                  height: 110,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (c, e, st) =>
                              Container(color: Colors.white12, alignment: Alignment.center, child: const Icon(Icons.broken_image, color: Colors.white70)),
                        ),
                      ),

                      // Optional small "Used" badge top-left
                      if (showUsedBadge)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.45),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Used',
                              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Info panel
                Container(
                  color: cardColor,
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                      ),

                      const SizedBox(height: 6),

                      // Spec line (smaller)
                      Text(
                        specLine,
                        style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
                      ),

                      const SizedBox(height: 8),

                      // Battery health (green)
                      Text(
                        batteryHealth,
                        style: TextStyle(color: accentColor, fontSize: 12, fontWeight: FontWeight.w600),
                      ),

                      const SizedBox(height: 12),

                      // Price row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            priceLabel,
                            style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 12),
                          ),
                          const Spacer(),
                          // optional small icon or percent badge can be placed here
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComboKitCard extends StatelessWidget {
  final String imagePath;
  final String title;       // e.g. Starter Kit Pro
  final String subtitle;    // e.g. Panels + Inverter + Battery
  final String ctaLabel;    // e.g. Shop Now
  final VoidCallback? onTap;
  final double borderRadius;
  final Color accentColor;

  const ComboKitCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.ctaLabel = 'Shop Now',
    this.onTap,
    this.borderRadius = 14,
    this.accentColor = const Color(0xFF2ECC71),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: 150,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (c, e, st) =>
                  Container(color: Colors.grey.shade800),
            ),

            // Dark gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.30),
                    Colors.black.withOpacity(0.55),
                  ],
                ),
              ),
            ),

            // Content (left bottom)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Subtitle
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Shop Now Button (Under Subtitle)
                    ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 1,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        ctaLabel,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

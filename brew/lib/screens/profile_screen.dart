import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data for profile
    final user = {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'profileImage': '',
      'address': '123 Coffee St, Brew City',
      'phone': '+1 234 567 8900',
    };

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xFF3E2723),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF3E2723)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Color(0xFF3E2723)),
            onPressed: () {
              // Navigate to edit profile screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFF6F4E37).withOpacity(0.1),
                    backgroundImage:
                        user['profileImage']!.isNotEmpty
                            ? NetworkImage(user['profileImage']!)
                            : null,
                    child:
                        user['profileImage']!.isEmpty
                            ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Color(0xFF6F4E37),
                            )
                            : null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user['name']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3E2723),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user['email']!,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  _buildProfileItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    onTap: () {
                      // Navigate to orders screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.location_on_outlined,
                    title: 'Delivery Address',
                    subtitle:
                        user['address']!.isNotEmpty
                            ? user['address']!
                            : 'Add address',
                    onTap: () {
                      // Navigate to address screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.phone_outlined,
                    title: 'Phone Number',
                    subtitle:
                        user['phone']!.isNotEmpty
                            ? user['phone']!
                            : 'Add phone number',
                    onTap: () {
                      // Navigate to phone screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.payment_outlined,
                    title: 'Payment Methods',
                    onTap: () {
                      // Navigate to payment methods screen
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                children: [
                  _buildProfileItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    onTap: () {
                      // Navigate to notifications screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.security_outlined,
                    title: 'Security',
                    onTap: () {
                      // Navigate to security screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    onTap: () {
                      // Navigate to help screen
                    },
                  ),
                  const Divider(height: 24),
                  _buildProfileItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    onTap: () {
                      // Navigate to about screen
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomButton(
                text: 'Log Out',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: const Text('Log Out'),
                          content: const Text(
                            'Are you sure you want to log out?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // authProvider.logout();
                                Navigator.of(ctx).pop();
                                Navigator.of(
                                  context,
                                ).pushReplacementNamed('/login');
                              },
                              child: const Text(
                                'Log Out',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                  );
                },
                backgroundColor: Colors.white,
                textColor: Colors.red,
                borderColor: Colors.red.shade300,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF6F4E37).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF6F4E37), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3E2723),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF3E2723),
            size: 16,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101323),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    const Expanded(
                      child: Text(
                        'Nurse Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Profile Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/female_white.png',
                        width: 128,
                        height: 128,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                              'assets/images/placeholder.png',
                              width: 128,
                              height: 128,
                              fit: BoxFit.cover,
                            ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Priya Sharma',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'Staff Nurse | 8 yrs exp',
                      style: TextStyle(color: Color(0xFF8E99CC), fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const Text(
                      'B. Sc. Nursing | Jaipur, Rajasthan',
                      style: TextStyle(color: Color(0xFF8E99CC), fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Contact Icons
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.phone,
                        color: Color(0xFF8E99CC),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.email,
                        color: Color(0xFF8E99CC),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Color(0xFF8E99CC),
                        size: 24,
                      ), // Placeholder for Instagram
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.facebook,
                        color: Color(0xFF8E99CC),
                        size: 24,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Ratings
              _buildRating('Rehire', 95),
              _buildRating('Dependable', 89),
              _buildRating('Skillful', 88),
              _buildRating('Profile Complete', 75),
              // About
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Priya is a dedicated staff nurse with extensive experience in both hospital and home care settings. She is known for her compassionate approach and commitment to providing personalized care, always staying abreast of the latest medical advancements.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              // Skills
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Skills',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _buildSkillChip('Ventilator'),
                    _buildSkillChip('BiPAP'),
                    _buildSkillChip('Tracheostomy'),
                    _buildSkillChip('Urine Catheter Care'),
                    _buildSkillChip('PEG Feeding'),
                    _buildSkillChip('Colostomy Care'),
                    _buildSkillChip('Bedsore Care'),
                  ],
                ),
              ),
              // Gallery
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 158,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  children: [
                    _buildGalleryImage('assets/images/female_asian_office.png'),
                    _buildGalleryImage('assets/images/male_indian.png'),
                    _buildGalleryImage('assets/images/female_white2.png'),
                    _buildGalleryImage('assets/images/male_white.png'),
                    _buildGalleryImage('assets/images/female_white3.png'),
                    _buildGalleryImage('assets/images/male_white_blazer.png'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  '+15 more',
                  textAlign: TextAlign.center, // Moved textAlign to Text widget
                  style: TextStyle(color: Color(0xFF8E99CC), fontSize: 14),
                ),
              ),
              // Work Experience (Hospital)
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Work Experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildExperience(
                image: 'assets/images/male_india1.png',
                title: 'Apollo Hospitals',
                subtitle: 'Staff Nurse',
                date: 'Jun 2016 - Nov 2018',
              ),
              _buildExperience(
                image: 'assets/images/female_asian_traveller.png',
                title: 'City Hospital',
                subtitle: 'Staff Nurse',
                date: 'Jun 2012 - Sep 2016',
              ),
              // Homecare Experience
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Homecare Experience',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildExperience(
                image: 'assets/images/female_asian_car.png',
                title: 'Mr. Rohan Verma, 75 yrs /M',
                subtitle: 'Saket, Delhi',
                date: 'Nov 2018 - Jan 2019 (3 months)',
              ),
              _buildExperience(
                image: 'assets/images/male_white_student.png',
                title: 'Mrs. Priya Kapoor, 68 yrs /F',
                subtitle: 'Saket, Delhi',
                date: 'Feb 2019 - Apr 2019 (2 months)',
              ),
              _buildExperience(
                image: 'assets/images/female_white.png',
                title: 'Mr. Arjun Singh, 82 yrs /M',
                subtitle: 'Saket, Delhi',
                date: 'May 2019 - Jul 2019 (2 months)',
              ),
              _buildExperience(
                image: 'assets/images/male_white_mall.png',
                title: 'Ms. Anjali Verma, 55 yrs /F',
                subtitle: 'Saket, Delhi',
                date: 'Aug 2019 - Oct 2019 (3 months)',
              ),
              _buildExperience(
                image: 'assets/images/doctor_white.png',
                title: 'Mr. Vikram Joshi, 60 yrs /M',
                subtitle: 'Saket, Delhi',
                date: 'Nov 2019 - Jan 2020 (3 months)',
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'See 15 More',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              // Education
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Education',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildExperience(
                image: 'assets/images/female_white2.png',
                title: 'Bachelor of Science in Nursing',
                subtitle: 'College of Nursing, Rajasthan',
                date: 'Jun 2008 - May 2012',
              ),
              _buildExperience(
                image: 'assets/images/male_indian2.png',
                title: '12th Standard',
                subtitle: 'High School',
                date: '2008',
              ),
              _buildExperience(
                image: 'assets/images/female_asian_office.png',
                title: '10th Standard',
                subtitle: 'Middle School',
                date: '2006',
              ),
              // Certifications
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Certifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildExperience(
                image: 'assets/images/male_white.png',
                title: 'Basic Life Support (BLS)',
                subtitle: 'American Heart Association',
                date: 'Jun 2015 (Valid upto Jun 2017)',
              ),
              _buildExperience(
                image: 'assets/images/female_white3.png',
                title: 'Advanced Cardiovascular Life Support (ACLS)',
                subtitle: 'American Heart Association',
                date: 'Jun 2015 (Valid upto Jun 2017)',
              ),
              // References
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'References',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildExperience(
                image: 'assets/images/male_india1.png',
                title: 'Mr. Arjun Singh',
                subtitle: 'Homecare, 2019',
                date: 'Former Patient (Consent Given)',
              ),
              _buildExperience(
                image: 'assets/images/female_asian_traveller.png',
                title: 'Ms. Anjali Verma',
                subtitle: 'Homecare, 2020',
                date: 'Former Patient (Consent Given)',
              ),
              // Testimonials
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Testimonials',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildTestimonial(
                image: 'assets/images/male_white_blazer.png',
                name: 'Sneha Patil',
                text:
                    'Priya provided exceptional care for my mother. Her compassion and expertise made a difficult time much easier for our family. Priya’s dedication extended beyond medical tasks; she created a warm and supportive environment, ensuring my mother felt comfortable and secure.',
                role: 'Patient’s Daughter',
              ),
              _buildTestimonial(
                image: 'assets/images/female_asian_car.png',
                name: 'Rohan Sharma',
                text:
                    'I felt safe and well-cared for under Priya’s care. Her attention to detail and positive attitude were truly remarkable.',
                role: 'Patient',
              ),
              // Charges
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Charges',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildCharge('12 hrs day shift', '₹1200/shift', Icons.wb_sunny),
              _buildCharge(
                '12 hrs night shift',
                '₹1400/shift',
                Icons.nightlight,
              ),
              _buildCharge('24 hrs shift', '₹2000/day', Icons.access_time),
              _buildCharge('Visit', '₹800/visit', Icons.home),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Client has to offer free food to staff. If unable to provide food, food charges have to be paid separately.',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              // Documents
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Documents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/placeholder.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF21284A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Request Access',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              // Report Profile
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Report Profile Anonymously',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _buildSkillChip('Fraud'),
                    _buildSkillChip('Unprofessional Behavior'),
                    _buildSkillChip('Unskilled'),
                    _buildSkillChip('Fake Details'),
                    _buildSkillChip('Unverified'),
                    _buildSkillChip('Other'),
                  ],
                ),
              ),
              // Bidding
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Bidding',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildBid(
                image: 'assets/images/male_indian.png',
                amount: '₹2700 (Accepted)',
                location: 'Saket, Delhi - 25 Jul',
              ),
              _buildBid(
                image: 'assets/images/female_white.png',
                amount: '₹2700 (Active)',
                location: 'Saket, Delhi - 25 Jul',
              ),
              _buildBid(
                image: 'assets/images/male_white_student.png',
                amount: '₹2600 (Rejected)',
                location: 'Saket, Delhi - 25 Jul',
              ),
              _buildBid(
                image: 'assets/images/female_asian_traveller.png',
                amount: '₹2200 (Your Bid)',
                location: 'Saket, Delhi - 25 Jul',
                action: 'Modify | Cancel',
                statusIcon: const Icon(
                  Icons.circle,
                  color: Color(0xFF0BDA65),
                  size: 12,
                ),
              ),
              _buildBid(
                image: 'assets/images/male_white_mall.png',
                amount: '₹2000 (Rejected)',
                location: 'Saket, Delhi - 25 Jul',
              ),
              // Footer
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF607AFB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Your Bid',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF21284A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        '- ₹2200 +',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRating(String title, int percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$percentage%',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: const Color(0xFF2F396A),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF607AFB)),
            minHeight: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Chip(
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      backgroundColor: const Color(0xFF21284A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildGalleryImage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          width: 158,
          height: 158,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/placeholder.png',
            width: 158,
            height: 158,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildExperience({
    required String image,
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/placeholder.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF8E99CC),
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF8E99CC),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonial({
    required String image,
    required String name,
    required String text,
    required String role,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: Image.asset(
              image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/placeholder.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start, // Fixed: Use textAlign property
                ),
                Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF8E99CC),
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start, // Fixed: Use textAlign property
                ),
                Text(
                  role,
                  style: const TextStyle(
                    color: Color(0xFF8E99CC),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start, // Fixed: Use textAlign property
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCharge(String shift, String price, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF21284A),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 16),
              Text(
                shift,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Text(
            price,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildBid({
    required String image,
    required String amount,
    required String location,
    String? action,
    Widget? statusIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: Image.asset(
                  image,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/placeholder.png',
                    width: 56,
                    height: 56,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xFF8E99CC),
                      fontSize: 14,
                    ),
                    maxLines: 2,
                  ),
                  if (action != null)
                    Text(
                      action,
                      style: const TextStyle(
                        color: Color(0xFF8E99CC),
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ],
          ),
          if (statusIcon != null) statusIcon,
        ],
      ),
    );
  }
}

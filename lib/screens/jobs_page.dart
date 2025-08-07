import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 2,
        title: const Text('Browse Jobs'),
        centerTitle: true,
        leading: const SizedBox(width: 24),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark, color: Color(0xFF111418)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a job, e.g. RN',
                hintStyle: const TextStyle(color: Color(0xFF637488)),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Icon(Icons.search, color: Color(0xFF637488)),
                ),
                filled: true,
                fillColor: const Color(0xFFF0F2F4),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(999),
                  borderSide: const BorderSide(color: Color(0xFF197FE5)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton('Nurse'),
                  const SizedBox(width: 12),
                  _buildFilterButton('All Gender'),
                  const SizedBox(width: 12),
                  _buildFilterButton('24 Hrs Duty'),
                ],
              ),
            ),
          ),
          Expanded(
            child: isListView
                ? GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width > 600
                          ? 2
                          : 1,
                      childAspectRatio: 2.0,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: jobListings.length,
                    itemBuilder: (context, index) =>
                        JobCard(job: jobListings[index]),
                  )
                : const Center(child: Text('Map View Placeholder')),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 144,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(999),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: isListView ? 4 : 72,
              top: 4,
              bottom: 4,
              width: 68,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF197FE5),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      color: isListView ? Colors.white : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isListView = true;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(
                      Icons.map,
                      color: isListView ? Colors.grey : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isListView = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildFilterButton(String label) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFFF0F2F4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111418),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF111418),
            size: 20,
          ),
        ],
      ),
    );
  }
}

class Job {
  final String title;
  final String postedBy;
  final String location;
  final String distance;
  final String description;
  final String date;
  final String price;
  final String imagePath; // Added for local images
  final bool isUrgent;

  Job({
    required this.title,
    required this.postedBy,
    required this.location,
    required this.distance,
    required this.description,
    required this.date,
    required this.price,
    required this.imagePath,
    this.isUrgent = false,
  });
}

final List<Job> jobListings = [
  Job(
    title: 'Female Nurse | 12h Day',
    postedBy: 'Posted by R. Sharma (Family)',
    location: 'Gurgaon',
    distance: '12 km away',
    description:
        'Duties: Wound dressing, medication admin, monitoring vitals for post-surgery patient.',
    date: '29 July',
    price: '₹ 1500',
    imagePath: 'assets/images/female_white.png',
    isUrgent: false,
  ),
  Job(
    title: 'Male Nurse | Visit',
    postedBy: 'Posted by Mr. Singh (Patient)',
    location: 'Faridabad',
    distance: '25 km away',
    description:
        'Requirements: Experienced male nurse for mobility support, companionship and daily activities.',
    date: '3 Aug',
    price: '₹ 1300',
    imagePath: 'assets/images/male_indian.png',
    isUrgent: false,
  ),
  Job(
    title: 'Female Nurse | 10h Day',
    postedBy: 'Posted by A. Gupta (Family)',
    location: 'Noida',
    distance: '18 km away',
    description:
        'Looking for a compassionate caregiver for an elderly patient. Light housekeeping and meal prep.',
    date: '5 Aug',
    price: '₹ 1100',
    imagePath: 'assets/images/female_asian_office.png',
    isUrgent: false,
  ),
  Job(
    title: 'Nurse | 12h Night',
    postedBy: 'Posted by S. Khan (Parent)',
    location: 'Delhi',
    distance: '10 km away',
    description:
        'Need a nurse experienced with children for overnight care. Tracheostomy care experience required.',
    date: 'Starts Today',
    price: '₹ 2000',
    imagePath: 'assets/images/female_white2.png',
    isUrgent: true,
  ),
  Job(
    title: 'Female Nurse | Visit',
    postedBy: 'Posted by P. Jain (Patient)',
    location: 'Gurgaon',
    distance: '15 km away',
    description:
        'Seeking a physiotherapist for post-stroke rehabilitation. Home visits required.',
    date: '10 Aug',
    price: '₹ 1600',
    imagePath: 'assets/images/female_asian_traveller.png',
    isUrgent: false,
  ),
  Job(
    title: 'Female Nurse | 24h',
    postedBy: 'Posted by K. Devi (Family)',
    location: 'Faridabad',
    distance: '22 km away',
    description:
        'Experienced nurse needed for a patient with advanced dementia. Patience and empathy are key.',
    date: '12 Aug',
    price: '₹ 2500',
    imagePath: 'assets/images/female_white3.png',
    isUrgent: false,
  ),
  Job(
    title: 'Male Nurse | Visit',
    postedBy: 'Posted by M. Verma (Patient)',
    location: 'Delhi',
    distance: '8 km away',
    description:
        'Need a nurse for diabetic foot ulcer dressing and care. Twice a week visits.',
    date: '15 Aug',
    price: '₹ 900',
    imagePath: 'assets/images/male_india1.png',
    isUrgent: false,
  ),
  Job(
    title: 'Male Nurse | 24h',
    postedBy: 'Posted by V. Singh (Family)',
    location: 'Noida',
    distance: '20 km away',
    description:
        'Need an experienced male nurse for a bedridden patient. Full-time care required.',
    date: '18 Aug',
    price: '₹ 2600',
    imagePath: 'assets/images/male_white.png',
    isUrgent: false,
  ),
  Job(
    title: 'Female Nurse | 12h Night',
    postedBy: 'Posted by S. Kumar (Patient)',
    location: 'Gurgaon',
    distance: '14 km away',
    description:
        'Overnight care for an elderly patient. Experience with dementia is preferred.',
    date: '20 Aug',
    price: '₹ 1800',
    imagePath: 'assets/images/female_asian_car.png',
    isUrgent: false,
  ),
  Job(
    title: 'Male Nurse | 12h Day',
    postedBy: 'Posted by R. Mehra (Family)',
    location: 'Delhi',
    distance: '9 km away',
    description:
        'Daytime care for a post-op patient. Medication management and mobility assistance.',
    date: '22 Aug',
    price: '₹ 1600',
    imagePath: 'assets/images/male_white2.png',
    isUrgent: false,
  ),
  Job(
    title: 'Nurse | Visit',
    postedBy: 'Posted by A. Kapoor (Patient)',
    location: 'Faridabad',
    distance: '28 km away',
    description:
        'Wound dressing and injection administration. Flexible timing for visits.',
    date: '25 Aug',
    price: '₹ 800',
    imagePath: 'assets/images/female_white.png',
    isUrgent: false,
  ),
  Job(
    title: 'Male Nurse | 12h Night',
    postedBy: 'Posted by L. Sharma (Family)',
    location: 'Noida',
    distance: '19 km away',
    description:
        'Overnight care for a patient recovering from surgery. Vitals monitoring and support.',
    date: '28 Aug',
    price: '₹ 1900',
    imagePath: 'assets/images/male_white_blazer.png',
    isUrgent: false,
  ),
];

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 112,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(12),
                    ),
                    child: Image.asset(
                      job.imagePath,
                      fit: BoxFit.cover,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/images/placeholder.png',
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                      size: 24,
                    ),
                  ),
                ),
                if (job.isUrgent)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFDE8E8),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Color(0xFFC81E1E),
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Urgent',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFC81E1E),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF111418),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      job.postedBy,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF637488),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xFF637488),
                          size: 16,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            '${job.location} | ${job.distance}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF637488),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      job.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF637488),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.date,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF637488),
                          ),
                        ),
                        Text(
                          job.price,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF197FE5),
                          ),
                        ),
                      ],
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

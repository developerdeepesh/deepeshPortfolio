import '../models/project_model.dart';
import '../../domain/entities/skill_entity.dart';
import '../../domain/entities/experience_entity.dart';

abstract class PortfolioLocalDataSource {
  List<ProjectModel> getProjects();

  List<SkillEntity> getSkills();

  List<ExperienceEntity> getExperiences();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  // @override
  // List<ProjectModel> getProjects() => [
  //       const ProjectModel(
  //         id: '1',
  //         title: 'Sarthak',
  //         description:
  //             'A Mobile-Based Employee Management Solution for the Government of Madhya Pradesh. '
  //             'Manages Employee Attendance, Activity, Tour, Holidays, My Team, and Profile with smart, customized features.',
  //         technologies: ['Flutter', 'Dart', 'REST APIs', 'Android', 'iOS'],
  //         imageUrl: 'https://picsum.photos/seed/sarthak/600/400',
  //         liveUrl: 'https://play.google.com/store/apps/details?id=com.mpssdi.sarthak',
  //         isFeatured: true,
  //       ),
  //       const ProjectModel(
  //         id: '2',
  //         title: 'NAKSHA',
  //         description:
  //             'National Geospatial Knowledge-based Land Survey of Urban Habitations by the Department of Land Resources (DoLR). '
  //             'Modernizes urban land records across 152+ cities in India to ensure accurate land ownership documentation.',
  //         technologies: ['Flutter', 'Dart', 'Geospatial', 'REST APIs'],
  //         imageUrl: 'https://picsum.photos/seed/naksha/600/400',
  //         liveUrl: 'https://play.google.com/store/apps/details?id=com.dolr.naksha',
  //         isFeatured: true,
  //       ),
  //       const ProjectModel(
  //         id: '3',
  //         title: 'DWRS',
  //         description:
  //             'Disaster Warning & Response System providing prior information of disasters, empowering officials and responders '
  //             'to take immediate actions. Covers natural, biological, industrial, and socio-political hazards.',
  //         technologies: ['Flutter', 'Dart', 'Android', 'iOS', 'REST APIs'],
  //         imageUrl: 'https://picsum.photos/seed/dwrs/600/400',
  //         liveUrl: 'https://play.google.com/store/apps/details?id=com.mapit.sderf',
  //         isFeatured: true,
  //       ),
  //       const ProjectModel(
  //         id: '4',
  //         title: 'Ujjain Mahakumbh 2028',
  //         description:
  //             'All-in-one companion app for Mahakumbh 2028. Features accurate maps, live events, temple details, '
  //             'route guidance, lost & found, emergency services, and real-time updates.',
  //         technologies: ['Flutter', 'Dart', 'Maps', 'Real-time', 'Android', 'iOS'],
  //         imageUrl: 'https://picsum.photos/seed/mahakumbh/600/400',
  //         liveUrl: 'https://play.google.com/store/apps/details?id=com.mobile.mahakumbh',
  //         isFeatured: true,
  //       ),
  //       const ProjectModel(
  //         id: '5',
  //         title: 'ICICI Bank – iMobile Pay',
  //         description:
  //             'Worked on UI revamp for ICICI Bank\'s iMobile Pay app. Led development of the Dashboard and CIBIL modules '
  //             'with a modern, refreshed UI as Tech Lead / Sr. Flutter Developer.',
  //         technologies: ['Flutter', 'Dart', 'Banking', 'Android', 'iOS'],
  //         imageUrl: 'https://picsum.photos/seed/icici/600/400',
  //         liveUrl: 'https://play.google.com/store/apps/details?id=com.csam.icici.bank.imobile',
  //       ),
  //       const ProjectModel(
  //         id: '6',
  //         title: 'Mobipetz',
  //         description:
  //             'E-commerce and pet care app for Singapore. Offers pet grooming, haircut, daycare, and product purchasing '
  //             'services — a one-stop solution for pet owners.',
  //         technologies: ['Flutter', 'Dart', 'E-Commerce', 'REST APIs'],
  //         imageUrl: 'https://picsum.photos/seed/mobipetz/600/400',
  //       ),
  //       const ProjectModel(
  //         id: '7',
  //         title: 'Agrinet',
  //         description:
  //             'Agri-tech app connecting farmers with drone service providers. Providers list drones with service time and location; '
  //             'farmers browse and book drone services directly from the app.',
  //         technologies: ['Flutter', 'Dart', 'REST APIs', 'Android'],
  //         imageUrl: 'https://picsum.photos/seed/agrinet/600/400',
  //       ),
  //       const ProjectModel(
  //         id: '8',
  //         title: 'Kathalog',
  //         description:
  //             'Restaurant discovery app used in California. Helps users search and explore restaurants with a clean, '
  //             'intuitive interface.',
  //         technologies: ['Flutter', 'Dart', 'REST APIs', 'Android'],
  //         imageUrl: 'https://picsum.photos/seed/kathalog/600/400',
  //       ),
  //     ];

  @override
  List<ProjectModel> getProjects() => [
    // const ProjectModel(
    //   id: '1',
    //   title: 'Sarthak',
    //   description:
    //       'A Mobile-Based Employee Management Solution for the Government of Madhya Pradesh. '
    //       'Manages Employee Attendance, Activity, Tour, Holidays, My Team, and Profile with smart, customized features.',
    //   technologies: ['Flutter', 'Dart', 'REST APIs', 'Android', 'iOS'],
    //   imageUrl: 'assets/images/sarthak.png',
    //   playStoreUrl: 'https://play.google.com/store/apps/details?id=com.mpssdi.sarthak',
    //   appStoreUrl: '- https://apps.apple.com/in/app/sarthak/id1543510698',
    //   isFeatured: true,
    // ),
    const ProjectModel(
      id: '1',
      title: 'NAKSHA',
      description:
          'National Geospatial Knowledge-based Land Survey of Urban Habitations by the Department of Land Resources (DoLR). '
          'Modernizes urban land records across 152+ cities in India to ensure accurate land ownership documentation.',
      technologies: ['Flutter', 'Dart', 'Geospatial', 'REST APIs'],
      imageUrl: 'assets/images/naksha.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.dolr.naksha',
      isFeatured: true,
    ),
    const ProjectModel(
      id: '2',
      title: 'DWRS',
      description:
          'Disaster Warning & Response System providing prior information of disasters, empowering officials and responders '
          'to take immediate actions. Covers natural, biological, industrial, and socio-political hazards.',
      technologies: ['Flutter', 'Dart', 'Android', 'iOS', 'REST APIs'],
      imageUrl: 'assets/images/dwrs.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mapit.sderf',
      appStoreUrl: 'https://apps.apple.com/in/app/dwrs/id6480442540',
      isFeatured: true,
    ),
    const ProjectModel(
      id: '3',
      title: 'Ujjain Mahakumbh 2028',
      description:
          'All-in-one companion app for Mahakumbh 2028. Features accurate maps, live events, temple details, '
          'route guidance, lost & found, emergency services, and real-time updates.',
      technologies: ['Flutter', 'Dart', 'Maps', 'Real-time', 'Android', 'iOS'],
      imageUrl: 'assets/images/ujjain.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.mahakumbh',
      appStoreUrl:
          'https://apps.apple.com/in/app/ujjainmahakumbh2028/id6756865608',
      isFeatured: true,
    ),
    const ProjectModel(
      id: '4',
      title: 'ICICI Bank – iMobile Pay',
      description:
          'Worked on UI revamp for ICICI Bank\'s iMobile Pay app. Led development of the Dashboard and CIBIL modules '
          'with a modern, refreshed UI as Tech Lead / Sr. Flutter Developer.',
      technologies: ['Flutter', 'Dart', 'Banking', 'Android', 'iOS'],
      imageUrl: 'assets/images/icici.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.csam.icici.bank.imobile',
      appStoreUrl:
          ' https://apps.apple.com/al/app/imobile-loan-cards-banking/id375276006',
    ),
    const ProjectModel(
      id: '5',
      title: 'Mobipetz',
      description:
          'E-commerce and pet care app for Singapore. Offers pet grooming, haircut, daycare, and product purchasing '
          'services — a one-stop solution for pet owners.',
      technologies: ['Flutter', 'Dart', 'E-Commerce', 'REST APIs'],
      imageUrl: 'assets/images/mobipetz.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.mobipetz',
      appStoreUrl: 'https://apps.apple.com/sg/app/mobipetz/id6447415330',
    ),
    const ProjectModel(
      id: '6',
      title: 'Agrinet',
      description:
          'Agri-tech app connecting farmers with drone service providers. Providers list drones with service time and location; '
          'farmers browse and book drone services directly from the app.',
      technologies: ['Flutter', 'Dart', 'REST APIs', 'Android', 'IOS'],
      imageUrl: 'assets/images/arginet.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.agrinet',
    ),
    const ProjectModel(
      id: '7',
      title: 'Jaap Counter',
      description:
          'Jaap Counter is a simple, clean, and powerful digital counter app designed to help you track your mantra chanting, mala completion, and daily spiritual progress with ease.',
      technologies: ['Flutter', 'Dart', 'REST APIs', 'Android', 'IOS'],
      imageUrl: 'assets/images/jaapCounter.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mobile.counter_app',
    ),
    const ProjectModel(
      id: '8',
      title: 'Kathalog',
      description:
          'Restaurant discovery app used in California. Helps users search and explore restaurants with a clean, '
          'intuitive interface.',
      technologies: ['Flutter', 'Dart', 'REST APIs', 'Android'],
      imageUrl: 'assets/images/kathalog.png',
    ),
  ];

  @override
  List<SkillEntity> getSkills() => const [
    // Mobile
    SkillEntity(name: 'Flutter', proficiency: 0.97, category: 'Mobile'),
    SkillEntity(name: 'Dart', proficiency: 0.95, category: 'Mobile'),
    SkillEntity(name: 'Android SDK', proficiency: 0.85, category: 'Mobile'),
    SkillEntity(name: 'Swift / iOS', proficiency: 0.70, category: 'Mobile'),
    // Backend & APIs
    SkillEntity(
      name: 'RESTful APIs',
      proficiency: 0.92,
      category: 'Backend & APIs',
    ),
    SkillEntity(
      name: 'SQLite / SQL',
      proficiency: 0.82,
      category: 'Backend & APIs',
    ),
    SkillEntity(name: 'JSON', proficiency: 0.95, category: 'Backend & APIs'),
    // Tools & Platforms
    SkillEntity(
      name: 'Git / Version Control',
      proficiency: 0.92,
      category: 'Tools',
    ),
    SkillEntity(name: 'Android Studio', proficiency: 0.90, category: 'Tools'),
    SkillEntity(name: 'Postman', proficiency: 0.88, category: 'Tools'),
    SkillEntity(name: 'Jira', proficiency: 0.80, category: 'Tools'),
    SkillEntity(
      name: 'Visual Studio / Cursor',
      proficiency: 0.85,
      category: 'Tools',
    ),
  ];

  @override
  List<ExperienceEntity> getExperiences() => const [
    ExperienceEntity(
      company: 'Techracers Pvt. Ltd. (Dqode) – Client: MP Govt.',
      role: 'Sr. Mobile Developer (Flutter) / Senior Team Leader',
      period: 'Jan 2025 – Present',
      description:
          'Leading mobile development for Government of Madhya Pradesh projects including Sarthak, NAKSHA, DWRS, and Ujjain Mahakumbh 2028.',
      achievements: [
        'Leading a team of Flutter developers delivering government-scale mobile apps',
        'Architected and shipped 4 production apps for MP Govt. on both Android & iOS',
        'Maintained close communication with government stakeholders for accurate progress reporting',
      ],
    ),
    ExperienceEntity(
      company: 'Tata Consultancy Services (TCS)',
      role: 'Technical Lead / Software Engineer',
      period: 'Mar 2024 – Dec 2024',
      description:
          'Served as Technical Lead on TCS-backed projects, driving Flutter development and team coordination.',
      achievements: [
        'Led Flutter development for enterprise-grade client projects under TCS',
        'Developed conversion and system implementation plans',
        'Provided process improvement input and coordinated cross-functional work activities',
      ],
    ),
    ExperienceEntity(
      company: 'GreyChain Technologies',
      role: 'Senior Flutter Engineer',
      period: 'Oct 2021 – Jan 2024',
      description:
          'Worked on ICICI Bank iMobile Pay app — led UI revamp for Dashboard and CIBIL modules as Sr. Flutter Developer.',
      achievements: [
        'Delivered new Dashboard and CIBIL module UI for ICICI iMobile Pay (10M+ users)',
        'Improved app performance through code optimization and efficient algorithms',
        'Launched mobile applications achieving high user ratings and positive feedback',
      ],
    ),
    ExperienceEntity(
      company: 'LMS Solutions (India) Pvt. Ltd.',
      role: 'Senior Flutter Engineer',
      period: 'Oct 2020 – Oct 2021',
      description:
          'Built Mobipetz (Singapore pet care e-commerce) and Agrinet (agri-tech drone services) as Sr. Flutter Developer.',
      achievements: [
        'Delivered Mobipetz — a full-featured pet care & e-commerce app for Singapore market',
        'Built Agrinet connecting farmers with drone service providers across India',
        'Developed positive working relationships with international stakeholders',
      ],
    ),
    ExperienceEntity(
      company: 'CitrusLeaf Software',
      role: 'Flutter Developer',
      period: 'Mar 2020 – Oct 2020',
      description:
          'Developed Kathalog, a restaurant discovery app for the California market.',
      achievements: [
        'Built and shipped Kathalog restaurant search app for the US market',
        'Implemented clean UI/UX with Flutter for cross-platform delivery',
      ],
    ),
    ExperienceEntity(
      company: 'Shreejee Infosolutions Pvt. Ltd.',
      role: 'Android Developer',
      period: 'Jul 2017 – Sep 2019',
      description:
          'Started career as an Android Developer, building native Android applications using Java and Android SDK.',
      achievements: [
        'Developed native Android applications using Java and Android SDK',
        'Gained strong foundation in mobile architecture, multithreading, and performance optimization',
      ],
    ),
  ];
}

class PortfolioData {
  PortfolioData._();

  // ── About quick facts ────────────────────────────────────────────────────
  static const List<(String, String)> quickFacts = [
    ('📍', 'Based in Ahmedabad India'),
    ('💼', 'Open to full-time & freelance'),
    ('🎯', 'Flutter · Dart · Firebase'),
    ('🔥', 'Passionate about UI/UX'),
  ];

  // ── Skills ───────────────────────────────────────────────────────────────
  static const List<({String name, int percent, String emoji})> skills = [
    (name: 'Flutter', percent: 95, emoji: 'assets/image/flutter.png'),
    (name: 'Android', percent: 98, emoji: 'assets/image/android.png'),
    (name: 'IOS', percent: 90, emoji: 'assets/image/apple.png'),
    (name: 'Dart', percent: 92, emoji: 'assets/image/dart.png'),
    (name: 'Firebase', percent: 88, emoji: 'assets/image/firebase.png'),
    (name: 'BLoC / Cubit', percent: 98, emoji: 'assets/image/bloc.png'),
    (name: 'REST API', percent: 95, emoji: 'assets/image/rest_api.png'),
    (name: 'Git', percent: 90, emoji: 'assets/image/git.png'),
    (name: 'Architecture', percent: 85, emoji: 'assets/image/arc.png'),
    (name: 'Google Maps', percent: 82, emoji: 'assets/image/map.json'),
  ];

  // ── Experience ───────────────────────────────────────────────────────────────

  static const List<
    ({
      String role,
      String company,
      String location,
      String period,
      List<String> points,
    })
  >
  experience = [
    (
      role: 'Flutter Developer',
      company: 'Banastech Private Limited',
      location: 'Ahmedabad, India',
      period: 'Dec 2023 – May 2026',
      points: [
        'Led end-to-end development of 3 production Flutter apps on Android & iOS.',
        'Implemented BLoC state management across all modules for clean architecture.',
        'Integrated Firebase Auth, Firestore, FCM push notifications and Crashlytics.',
        'Built RESTful API integration layer with HTTP, interceptors and error handling.',
        'Reduced app launch time by 40% through lazy loading and widget optimization.',
      ],
    ),
    (
      role: 'Flutter Intern',
      company: 'Global Garner Sales And Services',
      location: 'Ahmedabad, India',
      period: 'Jun 2023 – Sept 2023',
      points: [
        'Developed UI screens from Figma designs with pixel-perfect accuracy.',
        'Worked on a Food Live app, integrating Razorpay for payment processing.',
        'Maintained and refactored legacy codebase from setState to BloC.',
        'Collaborated with backend team on REST API contracts and testing.',
      ],
    ),
  ];

  // ── Projects ─────────────────────────────────────────────────────────────
  // githubUrl / liveUrl: set to '' to hide that button on the detail screen
  static List<
    ({
      String title,
      String desc,
      String longDesc,
      List<String> tags,
      String emoji,
      String status,

      String liveUrl,
      String liveUrlIOS,
    })
  >
  projects = [
    (
      title: 'Odoo CRM - Leads, Calls & Logs',
      desc:
          'Lead management, Activity Management, call logs, push notifications.',
      longDesc:
          'Odoo CRM - Leads, Calls & Logs is a smart lead management application designed to help businesses efficiently manage leads,'
          'Users can add and update leads, log activities, and store important notes in one place.'
          'The app supports direct calling, call log tracking, for seamless client communication.'
          'Push notifications alert agents on new lead assignments. It also includes document management for securely storing images and PDFs, along with a calendar view to organize tasks and follow-ups. Built for productivity, '
          'Odoo CRM - Leads, Calls & Logs ensures a smooth and organized workflow with a user-friendly experience.',
      tags: ['Flutter', 'Firebase', 'BLoC', 'Notifications', 'Android'],
      emoji: "assets/image/odoo_crm_logo_app.jpg",
      status: '🟢 Live',

      liveUrl:
          'https://play.google.com/store/apps/details?id=com.banasTech.odoo_crm&pcampaignid=web_share',
      liveUrlIOS: "",
    ),
    (
      title: 'Armee HRMS',
      desc:
          'Human resources management app with employee profiles, attendance tracking, and leave management.',
      longDesc:
          'Armee HRMS is a user-friendly Human Resource Management app designed to simplify daily workforce'
          'operations. It offers GPS-based attendance for easy check-in and check-out from any location. Employees'
          'can apply for leaves, track approvals, and monitor attendance records in real time. The app also provides'
          'secure access to payslips anytime. With instant notifications and a smooth interface, it enhances productivity'
          'and communication within organizations',
      tags: ['Flutter', 'Android', 'Ios', 'Firebase', "BloC"],
      emoji: "assets/image/armee_hrms.png",
      status: '🟢 Live',

      liveUrl:
          'https://play.google.com/store/apps/details?id=com.banasTech.hrms_armee&pcampaignid=web_share',
      liveUrlIOS: "https://apps.apple.com/in/app/armee-hrms/id6748517676",
    ),
    (
      title: 'ZapHalo for Whatsapp Business',
      desc:
          'ZapHalo – Smart Whatsapp Messaging & Campaign Management Made Easy',
      longDesc:
          'A WhatsApp-style chat app for real-time messaging. Template Based On Whatsapp Business With Some Extra Feature Like Schedule Message, Bulk Message, Group Messaging, Contact Management, '
          'Supports one-to-one chats, image/file sharing, read receipts, '
          'and online presence indicators. '
          'State managed with Bloc. Push notifications via FCM.',
      tags: ['Flutter', 'Websocket', 'BLoC', 'FCM', 'Firebase', 'Android'],
      emoji: "assets/image/zaphalo_log.png",
      status: '🟢 Live',

      liveUrl:
          'https://play.google.com/store/apps/details?id=com.banastech.zaphalo&pcampaignid=web_share',
      liveUrlIOS: "",
    ),
    (
      title: 'Cred Ment',
      desc:
          'Cred Ment is a Loan Management App that simplifies loan tracking and management. It offers features like loan application, payment reminders, and a user-friendly interface for easy financial organization.',
      longDesc:
          'Developed and maintained mobile features for CredMent, an open-source loan and financial management platform supporting the complete loan lifecycle from onboarding to repayment.'
          'Built responsive Flutter UI screens integrated with loan management, CRM, credit-score, and eKYC APIs to enhance user experience and operational efficiency.'
          'Implemented modular and scalable architecture with multi-language and multi-currency support to ensure global usability',
      tags: ['Flutter', 'Firebase', 'BLoC', 'FCM', 'Android'],
      emoji: "assets/image/crdlogo.png",
      status: '🟡 UnderDevelopment',

      liveUrl: '',
      liveUrlIOS: "",
    ),
  ];

  // ── Contact links ─────────────────────────────────────────────────────────
  // (emoji, label, displayText, fullUrl)
  static const List<(String, String, String, String)> contactLinks = [
    (
      '✉️',
      'Email',
      'rahuldpatil505@gmail.com',
      'mailto:rahuldpatil505@gmail.com',
    ),
    ('📞', 'Mobile', '+91 9904251895', 'tel:+919904251895'),
    (
      '💼',
      'LinkedIn',
      'Rahul Patil',
      'https://www.linkedin.com/in/rahul-patil-580bb624a/',
    ),
    ('🐙', 'GitHub', 'Rahul Patil Github', 'https://github.com/rahulpatil0505'),
  ];

  // ── Hero stats ───────────────────────────────────────────────────────────
  static const List<(String, String)> heroStats = [
    ('2.5 +', 'Years Experience'),
    ('4', 'Apps Built'),
    ('100%', 'Flutter Focused'),
  ];
}

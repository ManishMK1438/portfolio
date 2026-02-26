import 'package:flutter/material.dart';
import 'package:portfolio/app_icons_icons.dart';
import 'package:portfolio/core/exports/app_exports.dart';
import 'package:portfolio/features/home/home_exports.dart';

final List<ExperienceEntity> experienceData = [
  ExperienceEntity(
    heading: AppStrings.education,
    title: AppStrings.bca,
    company: AppStrings.university,
    duration: AppStrings.duration,
    location: AppStrings.marks,
  ),
  ExperienceEntity(
    heading: AppStrings.experience,
    title: "Associate Team Lead",
    company: "Goolean Technologies Pvt. Ltd.",
    duration: "May 2024 - Jan 2026",
    location: "Gurugram (On-Site)",
  ),
  ExperienceEntity(
    heading: AppStrings.experience,
    title: "Flutter developer",
    company: "Flyweis Technologies Pvt. Ltd.",
    duration: "Sept 2023 - Jan 2024",
    location: "Noida (Remote)",
  ),
  ExperienceEntity(
    heading: AppStrings.experience,
    title: "Flutter developer",
    company: "Locgfx Pvt. Ltd.",
    duration: "Feb 2022 - July 2023",
    location: "Delhi (On-site)",
  ),
];

final List<ProjectsEntity> projectsData = [
  ProjectsEntity(
    title: "CLOCKTales - Wifi attendance",
    description:
        "Effortlessly manage and monitor attendance with our feature-rich Attendance Tracking System, designed to streamline workforce management and enhance productivity. Whether you're an employer or employee, this app simplifies the entire attendance process.",
    playStore:
        "https://play.google.com/store/apps/details?id=com.goolean.clocktales&hl=en",
    appStore: "",
    image: AppImages.clockTales,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "Bluetooth Low Energy",
      "Geolocation",
      "FCM",
      "Hive",
      "Network info",
      "Clean Architecture",
    ],
  ),
  ProjectsEntity(
    title: "Brunhild",
    description:
        "Brunhild revolutionizes school safety by providing real-time critical alerts to authorities on any zone violation. Proactively monitor student and staff movements, ensuring a secure environment for everyone.",
    playStore:
        "https://play.google.com/store/apps/details?id=com.goolean.brunhild.brunhild&hl=en",
    appStore: "https://apps.apple.com/in/app/brunhild/id6744390104",
    image: AppImages.brunhild,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "Bluetooth Low Energy",
      "Geolocation",
      "FCM",
      "Hive",
      "Open street map",
      "Open route service",
      "Clean Architecture",
    ],
  ),
  ProjectsEntity(
    title: "Pasthi - News Hub",
    description:
        "Your Digital Hub for News, Conversations, and Community Engagement. Stay connected to the latest news and be a part of shaping the conversation with Pasthi. Our innovative platform combines the best of citizen journalism, social media, and news aggregation to provide a comprehensive digital experience.",
    playStore:
        "https://play.google.com/store/apps/details?id=com.locgfx.pasthi&hl=en",
    appStore: "",
    image: AppImages.pasthi,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "Geolocation",
      "Shared preferences",
      "FCM",
    ],
  ),
  ProjectsEntity(
    title: "Richie | Stocks & Options app",
    description:
        "Welcome to Richie App, where we blend seasoned trading expertise with cutting-edge technology to transform your financial journey. We know firsthand that successful trading goes beyond theoretical knowledge; it's about the practical application of strategies. Our platform is a testament to innovation, meticulously designed with a deep understanding of every investor and trader's needs, ensuring you stay at the forefront of the investment game.",
    playStore:
        "https://play.google.com/store/apps/details?id=com.chasealpha.richie&hl=en",
    appStore:
        "https://apps.apple.com/in/app/richie-stocks-options-app/id1659006578",
    image: AppImages.richie,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "Web socket",
      "Video player",
      "FCM",
      "Shared preferences",
      "Riverpod",
      "Razorpay",
    ],
  ),
  ProjectsEntity(
    title: "Ataraxis",
    description: "Live doctor consulting and appointment booking",
    playStore: "",
    appStore: "",
    image: AppImages.noImage,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "Web socket",
      "Agora SDK video calling",
      "FCM",
      "Shared preferences",
      "Stripe",
    ],
  ),
  ProjectsEntity(
    title: "Kidseau",
    description:
        "School management app - attendance marking, report cards, performance charts, time table and more",
    playStore: "",
    appStore: "",
    image: AppImages.noImage,
    technologies: [
      "Flutter",
      "Dart",
      "REST api",
      "FCM",
      "Shared preferences",
      "Stripe",
    ],
  ),
];

final List<SkillsEntity> skillsList = [
  SkillsEntity(
    color: Colors.blue,
    title: "Core Technologies",
    icon: AppIcons.coreTech,
    skills: ["Flutter", "Dart", "Android", "iOS", "Web", "Windows", "Mac OS"],
  ),
  SkillsEntity(
    title: "Architecture & State",
    color: Colors.purple,
    icon: AppIcons.architecture,
    skills: [
      "Clean architecture",
      "BLoC",
      "Riverpod",
      "Hive",
      "Shared preferences",
    ],
  ),
  SkillsEntity(
    color: Colors.green,
    title: "Backend & API",
    icon: AppIcons.backend,
    skills: ["REST api", "JSON", "FastAPI", "Web sockets", "Python"],
  ),
  SkillsEntity(
    title: "Firebase & Cloud",
    color: Colors.orange,
    icon: AppIcons.cloud,
    skills: ["Firebase auth", "Firebase storage", "FCM", "Firestore", "AWS"],
  ),
  SkillsEntity(
    title: "Media & Features",
    color: Colors.red,
    icon: AppIcons.media,
    skills: [
      "Agora",
      "Video calling",
      "Live streaming",
      "Video player",
      "Third party logins",
    ],
  ),
  SkillsEntity(
    color: Colors.blue.shade900,
    title: "Payments & Tools",
    icon: AppIcons.payment,
    skills: [
      "Razorpay",
      "Stripe",
      "Android studio",
      "Git/Github",
      "VS Code",
      "Docker",
    ],
  ),
  SkillsEntity(
    color: Colors.cyan,
    title: "Soft skills",
    icon: AppIcons.softSkills,
    skills: [
      "Leadership",
      "Problem solving",
      "Accountability",
      "Clean code practices",
      "Team collaboration",
      "Fast learner",
    ],
  ),
];

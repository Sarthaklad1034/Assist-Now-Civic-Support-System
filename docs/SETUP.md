## Complete Full Stack Project Setup Guide

---

## 📁 Project Directory Structure

```
Assist-Now-Civic-Support-System/
│
├── mobile-app/                 # Flutter Mobile App
│   ├── lib/
│   │   ├── main.dart
│   │   ├── config/
│   │   │   ├── api_config.dart
│   │   │   ├── theme_config.dart
│   │   │   └── routes.dart
│   │   ├── models/
│   │   │   ├── user_model.dart
│   │   │   ├── complaint_model.dart
│   │   │   └── location_model.dart
│   │   ├── screens/
│   │   │   ├── auth/
│   │   │   │   ├── login_screen.dart
│   │   │   │   └── register_screen.dart
│   │   │   ├── home/
│   │   │   │   └── home_screen.dart
│   │   │   ├── report/
│   │   │   │   ├── new_report_screen.dart
│   │   │   │   ├── camera_screen.dart
│   │   │   │   └── report_details_screen.dart
│   │   │   ├── tracking/
│   │   │   │   └── track_complaints_screen.dart
│   │   │   └── profile/
│   │   │       └── profile_screen.dart
│   │   ├── widgets/
│   │   │   ├── custom_button.dart
│   │   │   ├── complaint_card.dart
│   │   │   └── map_widget.dart
│   │   ├── services/
│   │   │   ├── api_service.dart
│   │   │   ├── auth_service.dart
│   │   │   ├── location_service.dart
│   │   │   ├── camera_service.dart
│   │   │   └── notification_service.dart
│   │   └── providers/
│   │       ├── auth_provider.dart
│   │       ├── complaint_provider.dart
│   │       └── theme_provider.dart
│   ├── assets/
│   │   ├── images/
│   │   ├── icons/
│   │   └── fonts/
│   ├── pubspec.yaml
│   └── README.md
│
├── admin-dashboard/            # React.js Admin Web Dashboard
│   ├── public/
│   │   ├── index.html
│   │   └── favicon.ico
│   ├── src/
│   │   ├── index.js
│   │   ├── App.js
│   │   ├── config/
│   │   │   ├── apiConfig.js
│   │   │   └── constants.js
│   │   ├── components/
│   │   │   ├── common/
│   │   │   │   ├── Navbar.jsx
│   │   │   │   ├── Sidebar.jsx
│   │   │   │   ├── Button.jsx
│   │   │   │   └── Modal.jsx
│   │   │   ├── auth/
│   │   │   │   ├── Login.jsx
│   │   │   │   └── ProtectedRoute.jsx
│   │   │   ├── dashboard/
│   │   │   │   ├── DashboardHome.jsx
│   │   │   │   ├── StatsCard.jsx
│   │   │   │   └── Charts.jsx
│   │   │   ├── complaints/
│   │   │   │   ├── ComplaintList.jsx
│   │   │   │   ├── ComplaintDetails.jsx
│   │   │   │   ├── AssignComplaint.jsx
│   │   │   │   └── ComplaintFilters.jsx
│   │   │   ├── analytics/
│   │   │   │   ├── ReportingTrends.jsx
│   │   │   │   ├── HeatMap.jsx
│   │   │   │   └── DeptPerformance.jsx
│   │   │   └── users/
│   │   │       ├── UserManagement.jsx
│   │   │       └── TeamManagement.jsx
│   │   ├── pages/
│   │   │   ├── Dashboard.jsx
│   │   │   ├── Complaints.jsx
│   │   │   ├── Analytics.jsx
│   │   │   ├── Users.jsx
│   │   │   └── Settings.jsx
│   │   ├── services/
│   │   │   ├── apiService.js
│   │   │   ├── authService.js
│   │   │   └── notificationService.js
│   │   ├── context/
│   │   │   ├── AuthContext.js
│   │   │   └── ComplaintContext.js
│   │   ├── hooks/
│   │   │   ├── useAuth.js
│   │   │   └── useComplaints.js
│   │   └── utils/
│   │       ├── helpers.js
│   │       └── validators.js
│   ├── package.json
│   ├── tailwind.config.js
│   └── README.md
│
├── backend/                    # Node.js + Express Backend
│   ├── src/
│   │   ├── index.js
│   │   ├── config/
│   │   │   ├── database.js
│   │   │   ├── cloudinary.js
│   │   │   ├── firebase.js
│   │   │   └── env.js
│   │   ├── models/
│   │   │   ├── User.js
│   │   │   ├── Complaint.js
│   │   │   ├── Department.js
│   │   │   ├── Notification.js
│   │   │   └── Feedback.js
│   │   ├── controllers/
│   │   │   ├── authController.js
│   │   │   ├── complaintController.js
│   │   │   ├── userController.js
│   │   │   ├── departmentController.js
│   │   │   ├── analyticsController.js
│   │   │   └── notificationController.js
│   │   ├── routes/
│   │   │   ├── authRoutes.js
│   │   │   ├── complaintRoutes.js
│   │   │   ├── userRoutes.js
│   │   │   ├── departmentRoutes.js
│   │   │   └── analyticsRoutes.js
│   │   ├── middleware/
│   │   │   ├── authMiddleware.js
│   │   │   ├── errorMiddleware.js
│   │   │   ├── uploadMiddleware.js
│   │   │   └── validationMiddleware.js
│   │   ├── services/
│   │   │   ├── aiRoutingService.js
│   │   │   ├── emailService.js
│   │   │   ├── smsService.js
│   │   │   ├── pushNotificationService.js
│   │   │   └── analyticsService.js
│   │   ├── utils/
│   │   │   ├── logger.js
│   │   │   ├── responseHandler.js
│   │   │   └── validators.js
│   │   └── sockets/
│   │       └── socketHandler.js
│   ├── package.json
│   ├── .env.example
│   └── README.md
│
├── shared/                     # Shared utilities & constants
│   ├── constants.js
│   └── types.js
│
├── docs/                       # Documentation
│   ├── API.md
│   ├── SETUP.md
│   └── ARCHITECTURE.md
│
├── .gitignore
└── README.md
```

---

## 🚀 Step-by-Step Setup Commands

### 1️⃣ Create Root Project Directory

```bash
mkdir Assist-Now-Civic-Support-System
cd Assist-Now-Civic-Support-System
git init
```

---

### 2️⃣ Flutter Mobile App Setup

```bash
# Create Flutter project
flutter create mobile_app
cd mobile_app

# Add required dependencies
flutter pub add provider
flutter pub add http
flutter pub add shared_preferences
flutter pub add image_picker
flutter pub add geolocator
flutter pub add permission_handler
flutter pub add google_maps_flutter
flutter pub add firebase_core
flutter pub add firebase_messaging
flutter pub add flutter_local_notifications
flutter pub add dio
flutter pub add get_it
flutter pub add cached_network_image
flutter pub add intl
flutter pub add image_cropper

# Create directory structure
mkdir -p lib/{config,models,screens/{auth,home,report,tracking,profile},widgets,services,providers}

cd ..
```

**Key Flutter Files to Create:**

1. `lib/main.dart` - Entry point
2. `lib/config/api_config.dart` - API endpoints
3. `lib/services/api_service.dart` - HTTP client
4. `lib/models/complaint_model.dart` - Data models
5. `lib/screens/home/home_screen.dart` - Main screen

---

### 3️⃣ React Admin Dashboard Setup

```bash
# Create React app with Vite (faster than CRA)
npm create vite@latest admin-dashboard -- --template react
cd admin-dashboard

# Install dependencies
npm install

# Install additional packages
npm install react-router-dom
npm install axios
npm install tailwindcss postcss autoprefixer
npm install @headlessui/react
npm install @heroicons/react
npm install recharts
npm install react-hot-toast
npm install date-fns
npm install socket.io-client
npm install react-leaflet leaflet
npm install zustand
npm install react-query

# Initialize Tailwind CSS
npx tailwindcss init -p

# Create directory structure
mkdir -p src/{components/{common,auth,dashboard,complaints,analytics,users},pages,services,context,hooks,utils}

cd ..
```

**Key React Files to Create:**

1. `src/App.js` - Main app component
2. `src/config/apiConfig.js` - API configuration
3. `src/services/apiService.js` - Axios instance
4. `src/pages/Dashboard.jsx` - Admin dashboard
5. `src/components/complaints/ComplaintList.jsx` - Complaint management

---

### 4️⃣ Node.js Backend Setup

```bash
# Create backend directory
mkdir backend
cd backend

# Initialize Node.js project
npm init -y

# Install dependencies
npm install express
npm install mongoose
npm install dotenv
npm install cors
npm install bcryptjs
npm install jsonwebtoken
npm install express-validator
npm install multer
npm install cloudinary
npm install firebase-admin
npm install nodemailer
npm install socket.io
npm install winston
npm install helmet
npm install express-rate-limit
npm install compression

# Install dev dependencies
npm install --save-dev nodemon

# Create directory structure
mkdir -p src/{config,models,controllers,routes,middleware,services,utils,sockets}

# Create entry file
touch src/index.js
touch .env.example

cd ..
```

**Key Backend Files to Create:**

1. `src/index.js` - Server entry point
2. `src/config/database.js` - MongoDB connection
3. `src/models/Complaint.js` - Mongoose schemas
4. `src/controllers/complaintController.js` - Business logic
5. `src/routes/complaintRoutes.js` - API routes

---

## 📝 Initial Configuration Files

### Backend: `package.json` scripts

```json
{
  "scripts": {
    "start": "node src/index.js",
    "dev": "nodemon src/index.js",
    "test": "jest"
  }
}
```

### Backend: `.env.example`

```env
PORT=5000
NODE_ENV=development

# Database
MONGODB_URI=mongodb://localhost:27017/Assist-Now-Civic-Support-System
MONGODB_ATLAS_URI=your_mongodb_atlas_connection_string

# JWT
JWT_SECRET=your_jwt_secret_key_here
JWT_EXPIRE=7d

# Cloudinary
CLOUDINARY_CLOUD_NAME=your_cloud_name
CLOUDINARY_API_KEY=your_api_key
CLOUDINARY_API_SECRET=your_api_secret

# Firebase
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_PRIVATE_KEY=your_private_key
FIREBASE_CLIENT_EMAIL=your_client_email

```

### Flutter: `pubspec.yaml` (add to dependencies)

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  http: ^1.1.0
  shared_preferences: ^2.2.2
  image_picker: ^1.0.5
  geolocator: ^10.1.0
  permission_handler: ^11.0.1
  google_maps_flutter: ^2.5.0
  firebase_core: ^2.24.0
  firebase_messaging: ^14.7.4
  flutter_local_notifications: ^16.2.0
  dio: ^5.4.0
  get_it: ^7.6.4
  cached_network_image: ^3.3.0
  intl: ^0.18.1
```

### React: `tailwind.config.js`

```javascript
module.exports = {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#2563eb",
        secondary: "#10b981",
        danger: "#ef4444",
      },
    },
  },
  plugins: [],
};
```

---

## 🎯 Development Workflow - Start Order

### Step 1: Start Backend First

```bash
cd backend
npm run dev
# Server should run on http://localhost:5000
```

### Step 2: Start Admin Dashboard

```bash
cd admin-dashboard
npm run dev
# Dashboard should run on http://localhost:5173
```

### Step 3: Start Flutter App

```bash
cd mobile_app
flutter run
# For web: flutter run -d chrome
# For Android: flutter run -d <device_id>
```

---

## 🔧 VS Code Workspace Setup

Create `Assist-Now-Civic-Support-System.code-workspace` in root:

```json
{
  "folders": [
    {
      "path": "mobile_app",
      "name": "Flutter Mobile App"
    },
    {
      "path": "admin-dashboard",
      "name": "React Admin Dashboard"
    },
    {
      "path": "backend",
      "name": "Node.js Backend"
    }
  ],
  "settings": {
    "editor.formatOnSave": true,
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  }
}
```

**VS Code Extensions to Install:**

- Flutter
- Dart
- ES7+ React/Redux/React-Native snippets
- Tailwind CSS IntelliSense
- ESLint
- Prettier
- MongoDB for VS Code
- REST Client

---

## 📱 Next Steps - Development Phase Order

### Phase 1: Backend Foundation

1. Set up Express server and MongoDB connection
2. Create User and Complaint models
3. Implement authentication (JWT)
4. Build CRUD APIs for complaints
5. Add image upload with Cloudinary
6. Implement basic routing logic

### Phase 2: Mobile App Core

1. Set up navigation and routing
2. Create authentication screens
3. Build home screen with complaint submission
4. Implement camera and location features
5. Create complaint tracking screen
6. Add offline-first capabilities

### Phase 3: Admin Dashboard

1. Create login and authentication
2. Build main dashboard with statistics
3. Implement complaint management interface
4. Add assignment and routing features
5. Create analytics and reporting views
6. Add real-time notifications

### Phase 4: Integration & Polish

1. Connect all components
2. Implement Socket.io for real-time updates
3. Add Firebase notifications
4. Test end-to-end workflows
5. Optimize performance
6. Add error handling and logging

### Phase 5: Advanced Features

1. AI-powered routing
2. Heat map analytics
3. SLA management
4. Multi-language support
5. Voice input
6. Photo verification

---

## 🔐 Security Checklist

- [ ] Environment variables properly configured
- [ ] JWT authentication implemented
- [ ] Password hashing with bcrypt
- [ ] Input validation on all endpoints
- [ ] CORS properly configured
- [ ] Rate limiting enabled
- [ ] File upload validation
- [ ] HTTPS in production

---

## 📦 Git Setup

Create `.gitignore` in root:

```gitignore
# Dependencies
node_modules/
.pnp
.pnp.js

# Environment
.env
.env.local
.env.production

# Flutter
.dart_tool/
.packages
build/
.flutter-plugins
.flutter-plugins-dependencies

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
logs/
*.log

# Production
dist/
build/
```

---

## 🧪 Testing Setup

### Backend Testing

```bash
cd backend
npm install --save-dev jest supertest
```

### Flutter Testing

```bash
cd mobile_app
flutter test
```

### React Testing

```bash
cd admin-dashboard
npm install --save-dev @testing-library/react @testing-library/jest-dom vitest
```

---

## ⚡ Quick Start Summary

```bash
# Clone/Create project
mkdir Assist-Now-Civic-Support-System && cd Assist-Now-Civic-Support-System

# Create all three projects
flutter create mobile_app
npm create vite@latest admin-dashboard -- --template react
mkdir backend && cd backend && npm init -y

# Install all dependencies (run in separate terminals)
cd mobile_app && flutter pub get
cd admin-dashboard && npm install
cd backend && npm install

# Start development
cd backend && npm run dev        # Terminal 1
cd admin-dashboard && npm run dev # Terminal 2
cd mobile_app && flutter run      # Terminal 3
```

---

**Ready to start building? Begin with Phase 1: Backend Foundation! 🚀**

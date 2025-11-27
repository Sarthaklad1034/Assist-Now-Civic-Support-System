# 🤝 Team Collaboration Workflow

## Quick Overview

This guide explains how multiple team members work together on the Assist Now project using GitHub Desktop.

---

## 📋 Prerequisites (One-Time Setup)

Each team member needs:

- ✅ GitHub account
- ✅ GitHub Desktop installed
- ✅ VS Code installed
- ✅ Flutter SDK installed (for mobile team)
- ✅ Node.js installed (for backend team)

---

## 🎯 Repository Structure

```
Assist-Now-Civic-Support-System/
|
├── mobile_app/          # Flutter team works here
├── admin-dashboard/     # Frontend team works here
├── backend/            # Backend team works here
└── docs/              # Documentation
```

---

## 🚀 Getting Started (First Time)

### Step 1: Clone Repository

1. Open **GitHub Desktop**
2. Click `File` → `Clone Repository`
3. Select `assist-now` from your repositories
4. Choose folder location
5. Click **Clone**

### Step 2: Open in VS Code

1. In GitHub Desktop, click `Repository` → `Open in Visual Studio Code`
2. You're ready to code!

---

## 🔄 Daily Workflow (MOST IMPORTANT)

### 🟢 BEFORE You Start Coding

```
1. Open GitHub Desktop
2. Click "Fetch Origin" button
3. If updates available, click "Pull Origin"
4. Wait for download to complete
```

**Why?** Get latest changes from your teammates.

---

### 🟡 WHILE You're Coding

Work in your assigned folder:

- **Mobile team** → `mobile_app/`
- **Frontend team** → `admin-dashboard/`
- **Backend team** → `backend/`

**Golden Rule:** Don't edit files in other team's folders unless coordinated.

---

### 🔵 AFTER You Finish Coding

```
1. Save all files in VS Code (Ctrl+S)
2. Open GitHub Desktop
3. Review changed files (left panel)
4. Write commit message:
   Summary: "Added login screen UI"
   Description: (optional details)
5. Click "Commit to main"
6. Click "Push Origin"
```

**Why?** Share your work with the team.

---

## ⚠️ Handling Conflicts (Simple)

### What's a Conflict?

When 2 people edit the **same lines** in the **same file**.

### How to Avoid?

- Work in separate folders
- Pull often
- Communicate before editing shared files

### If Conflict Happens?

GitHub Desktop will show a warning:

```
1. Don't panic
2. Click "Open in VS Code"
3. You'll see conflict markers:
   <<<<<<< HEAD
   Your code
   =======
   Their code
   >>>>>>> main
4. Keep the correct version
5. Delete conflict markers
6. Save → Commit → Push
```

**Better?** Ask teammate to help resolve together.

---

## 📊 Tracking Changes (Visual)

### See What Changed

In GitHub Desktop:

- **Left Panel** → Changed files
- **Right Panel** → Line-by-line comparison
- Green = Added
- Red = Removed

### See History

1. Click **History** tab
2. See all commits
3. Click any commit to view changes
4. See who changed what and when

### Undo Mistakes

Right-click commit → **Revert This Commit**

---

## 💡 Best Practices

### ✅ DO

- Pull before starting work
- Commit small, logical changes
- Write clear commit messages
- Push at least 2-3 times per day
- Communicate in team chat
- Test before pushing

### ❌ DON'T

- Edit same file simultaneously
- Commit untested code
- Push broken code
- Force push (advanced Git command)
- Delete teammate's work
- Ignore conflicts

---

## 🎯 Quick Reference Card

```
┌─────────────────────────────────────┐
│  BEFORE CODING:  Pull Origin        │
│  DURING CODING:  Work in your folder│
│  AFTER CODING:   Commit + Push      │
│                                     │
│  GOLDEN RULE:    Pull → Code → Push│
└─────────────────────────────────────┘
```

**Need Help?** Ask in team chat or check History tab to see what changed.

**Happy Collaborating! 🚀**

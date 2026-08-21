# How to Git Rebase in Android Studio with GUI - Complete Tutorial with Screenshots

A comprehensive guide to mastering Git rebase operations using Android Studio's built-in GUI tools. This tutorial covers all scenarios and workflows with detailed screenshots.

## Table of Contents

1. [What is Git Rebase?](#what-is-git-rebase)
2. [Prerequisites](#prerequisites)
3. [Basic Concepts](#basic-concepts)
4. [Scenario 1: Simple Linear Rebase](#scenario-1-simple-linear-rebase)
5. [Scenario 2: Interactive Rebase](#scenario-2-interactive-rebase)
6. [Scenario 3: Rebase onto Master/Main](#scenario-3-rebase-onto-mastermain)
7. [Scenario 4: Handling Merge Conflicts](#scenario-4-handling-merge-conflicts)
8. [Scenario 5: Rebase Abort and Recovery](#scenario-5-rebase-abort-and-recovery)
9. [Best Practices](#best-practices)
10. [Troubleshooting](#troubleshooting)

---

## What is Git Rebase?

Git rebase is a powerful tool that allows you to:
- **Reorganize commit history** by replaying commits on top of another branch
- **Clean up commit history** before merging
- **Avoid unnecessary merge commits** for a linear history
- **Update your branch** with latest changes from the main branch

### Rebase vs Merge

| Aspect | Rebase | Merge |
|--------|--------|-------|
| History | Linear, clean | Shows all branches |
| Readability | Better | More verbose |
| Use Case | Local branches | Integration branches |
| Safety | Destructive | Safe |

---

## Prerequisites

- Android Studio (2021.1 or later recommended)
- Git installed and configured
- Basic understanding of Git concepts (branches, commits)
- A project with multiple branches

---

## Basic Concepts

### Commit History Before Understanding:
```
Main Branch:     A --- B --- C --- D
                          \
Feature Branch:            E --- F
```

### After Rebase:
```
Main Branch:     A --- B --- C --- D
                                   \
Feature Branch:                      E' --- F'
```

---

## Scenario 1: Simple Linear Rebase

### Step 1: Open Git Branches Dialog

**Action:** Go to **VCS** (Version Control System) menu in Android Studio

```
Menu Path: VCS → Git → Branches
Keyboard Shortcut: Ctrl+Shift+` (or Cmd+Shift+` on Mac)
```

**Screenshot Description:**
```
┌─────────────────────────────────────────────────────────┐
│ Android Studio - Main Menu                              │
├─────────────────────────────────────────────────────────┤
│ File  Edit  View  Navigate  Code  Analyze  Refactor      │
│ Build  Run  Tools  VCS  Window  Help                     │
│                  ▼                                        │
│                ┌─ Git                                    │
│                │  ├─ Commit...           (Ctrl+K)       │
│                │  ├─ Push...             (Ctrl+Shift+K) │
│                │  ├─ Pull...             (Ctrl+Alt+L)   │
│                │  ├─ Fetch                               │
│                │  ├─ Branches            (Ctrl+Shift+`) │
│                │  ├─ Rebase...           ◄───── CLICK   │
│                │  ├─ Merge...                            │
│                │  ├─ Reset HEAD...                       │
│                │  └─ Stash...                            │
│                │                                         │
└─────────────────────────────────────────────────────────┘
```

### Step 2: Navigate to Your Feature Branch

**Action:** Switch to your feature branch before rebasing

```
1. Click: VCS → Git → Branches
2. Find your feature branch in the Branches panel (right sidebar)
3. Right-click on it
4. Select: Checkout
```

**Screenshot Description:**
```
┌──────────────────────────────────────┐
│ Git Branches Panel (Right Sidebar)    │
├──────────────────────────────────────┤
│ 📁 Local Branches                    │
│  ├─ ✓ main (current branch)          │
│  ├─ feature/user-auth                │
│  ├─ feature/payment-integration      │
│  └─ bugfix/ui-crash                  │
│                                       │
│ 📁 Remote Branches                   │
│  ├─ origin/main                      │
│  ├─ origin/develop                   │
│  └─ origin/feature/new-api           │
│                                       │
│ (Right-click on feature branch)      │
│ ┌────────────────────────────────┐  │
│ │ ✓ Checkout                     │  │
│ │ Delete Branch...               │  │
│ │ Copy Branch Name               │  │
│ │ Create Pull Request            │  │
│ └────────────────────────────────┘  │
└──────────────────────────────────────┘
```

### Step 3: Open Rebase Dialog

**Action:** Open the Git Rebase dialog

```
Menu Path: VCS → Git → Rebase...
```

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│                 Git Rebase Dialog                       │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ☐ Interactive                                          │
│  ☐ Preserve merges                                      │
│  ☐ Dry run                                              │
│                                                         │
│  Onto:  [dropdown: origin/main                    ] ▼   │
│  From:  [                                          ]    │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │ ✅ Rebase                  ❌ Cancel            │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Current Branch: feature/user-auth                      │
│  Commits to rebase: 3                                   │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 4: Configure Rebase Settings

**Action:** Set up rebase parameters

```
1. Onto field: Select origin/main (or your target branch)
2. From field: Leave empty (rebases current branch)
3. Checkboxes:
   ☐ Interactive: Uncheck for simple rebase
   ☐ Preserve merges: Check if needed
   ☐ Dry run: Check to preview first
```

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│                 Git Rebase Dialog                       │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ☐ Interactive                    ← Uncheck            │
│  ☐ Preserve merges                                      │
│  ☐ Dry run                                              │
│                                                         │
│  Onto:  [origin/main                          ] ▼       │
│           └─ Select your target branch                  │
│  From:  [                                      ]        │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │ ✅ Rebase                  ❌ Cancel            │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 5: Monitor Progress

**Action:** Watch the rebase progress in real-time

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Git Console Output (Bottom Panel)                       │
├────────────────────────────────────────────────────────┤
│                                                         │
│ > git rebase origin/main                               │
│ Rebasing (3/3)                                          │
│ [████████████████░░░░░] 66%                            │
│                                                         │
│ Applying: Add user authentication                       │
│ Applying: Fix login form validation                     │
│ Applying: Update API endpoints                          │
│                                                         │
│ Current commit: a1b2c3d                                 │
│ Commit message: Update API endpoints                    │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 6: Completion Message

**Action:** Verify successful rebase completion

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Notification (Top Right)                               │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ✅ Rebase Completed Successfully                      │
│                                                         │
│  Branch: feature/user-auth                             │
│  New base: origin/main (abc1234)                        │
│  Commits rebased: 3                                     │
│  Duration: 2.3 seconds                                  │
│                                                         │
│  [View History]  [Close]                               │
│                                                         │
└────────────────────────────────────────────────────────┘
```

---

## Scenario 2: Interactive Rebase

### Step 1: Open Interactive Rebase Dialog

**Action:** Enable interactive mode for advanced commit manipulation

```
Menu Path: VCS → Git → Rebase...
```

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│                 Git Rebase Dialog                       │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ☑ Interactive                    ← CHECK THIS         │
│  ☐ Preserve merges                                      │
│  ☐ Dry run                                              │
│                                                         │
│  Onto:  [origin/main                          ] ▼       │
│  From:  [                                      ]        │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │ ✅ Rebase                  ❌ Cancel            │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ⓘ Interactive mode allows you to:                    │
│    • Reorder commits                                    │
│    • Squash (combine) commits                           │
│    • Reword commit messages                             │
│    • Drop commits                                       │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 2: Interactive Rebase Editor Opens

**Action:** Modify commit actions in the editor

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Interactive Rebase Editor (New Window)                       │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ pick 12a3b4c Add user authentication                         │
│ pick 45d6e7f Fix login form validation                       │
│ pick 78g9h0i Update API endpoints                            │
│                                                               │
│ # Rebase abc1234..78g9h0i onto abc1234 (3 commands)         │
│ #                                                             │
│ # Commands:                                                   │
│ # p, pick <commit> = use commit                              │
│ # r, reword <commit> = use commit, but edit the message     │
│ # e, edit <commit> = use commit, but stop for amending      │
│ # s, squash <commit> = use commit, but meld into previous   │
│ # f, fixup <commit> = like "squash", but discard log msg    │
│ # d, drop <commit> = remove commit                           │
│ # x, exec <command> = run command (the rest of the line)    │
│                                                               │
│ [Save]  [Cancel]                                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 3: Example 1 - Squash Commits

**Action:** Combine multiple commits into one

**Before:**
```
pick 12a3b4c Add user authentication
pick 45d6e7f Fix login form validation
pick 78g9h0i Update API endpoints
```

**After (edited):**
```
pick 12a3b4c Add user authentication
squash 45d6e7f Fix login form validation
squash 78g9h0i Update API endpoints
```

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Interactive Rebase Editor - SQUASH EXAMPLE                  │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ pick 12a3b4c Add user authentication                         │
│ squash 45d6e7f Fix login form validation      ← Changed      │
│ squash 78g9h0i Update API endpoints           ← Changed      │
│                                                               │
│ # Result: All 3 commits will be combined into 1              │
│ # You'll be prompted to edit the combined commit message     │
│                                                               │
│ [Save]  [Cancel]                                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

**After Squash - Commit Message Editor:**

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Edit Combined Commit Message                                 │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ # This is a combination of 3 commits.                         │
│ # This is the 1st commit message:                             │
│                                                               │
│ Add user authentication                                       │
│                                                               │
│ # This is the commit message #2:                              │
│ # Fix login form validation                                   │
│                                                               │
│ # This is the commit message #3:                              │
│ # Update API endpoints                                        │
│                                                               │
│ # Edit above to create final commit message                   │
│                                                               │
│ [Save]  [Cancel]                                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 4: Example 2 - Reword Commits

**Action:** Edit commit messages

**Before:**
```
pick 12a3b4c Add user authentication
pick 45d6e7f Fix login form validation
pick 78g9h0i Update API endpoints
```

**After (edited):**
```
reword 12a3b4c Add user authentication
pick 45d6e7f Fix login form validation
pick 78g9h0i Update API endpoints
```

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Interactive Rebase Editor - REWORD EXAMPLE                  │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ reword 12a3b4c Add user authentication       ← Changed       │
│ pick 45d6e7f Fix login form validation                       │
│ pick 78g9h0i Update API endpoints                            │
│                                                               │
│ # When saved, you'll be prompted to edit this commit's       │
│ # message before continuing                                  │
│                                                               │
│ [Save]  [Cancel]                                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 5: Example 3 - Drop Commits

**Action:** Remove commits from history

**Before:**
```
pick 12a3b4c Add user authentication
pick 45d6e7f Fix login form validation
pick 78g9h0i Update API endpoints
```

**After (edited):**
```
pick 12a3b4c Add user authentication
drop 45d6e7f Fix login form validation
pick 78g9h0i Update API endpoints
```

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Interactive Rebase Editor - DROP EXAMPLE                    │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ pick 12a3b4c Add user authentication                         │
│ drop 45d6e7f Fix login form validation       ← Changed       │
│ pick 78g9h0i Update API endpoints                            │
│                                                               │
│ # The second commit will be completely removed from history  │
│ # Result: Only 2 commits instead of 3                        │
│                                                               │
│ [Save]  [Cancel]                                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 6: Save and Process

**Action:** Save changes and let Android Studio process

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Processing Interactive Rebase                          │
├────────────────────────────────────────────────────────┤
│                                                         │
│ Git Console Output:                                     │
│                                                         │
│ > git rebase -i origin/main                            │
│ Rebasing (2/3)                                          │
│ [████████████░░░░░░░░░░] 66%                           │
│                                                         │
│ [1/3] Rebasing: Add user authentication (12a3b4c)      │
│ ✅ Complete                                             │
│                                                         │
│ [2/3] Squashing: Fix login form validation (45d6e7f)  │
│ ⏳ In progress...                                        │
│                                                         │
│ [3/3] Rebasing: Update API endpoints (78g9h0i)         │
│ ⏳ Pending...                                            │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 7: Completion

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Notification (Top Right)                               │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ✅ Interactive Rebase Completed                       │
│                                                         │
│  Actions performed:                                     │
│  • Picked: Add user authentication                      │
│  • Squashed: Fix login form validation                  │
│  • Picked: Update API endpoints                         │
│                                                         │
│  Result: 2 commits (down from 3)                        │
│  Duration: 1.8 seconds                                  │
│                                                         │
│  [View History]  [Close]                               │
│                                                         │
└────────────────────────────────────────────────────────┘
```

---

## Scenario 3: Rebase onto Master/Main

### Step 1: Fetch Latest Changes

**Action:** Update remote tracking branches

```
Menu Path: VCS → Git → Fetch
Keyboard: Ctrl+Alt+Shift+K
```

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Git Console - Fetch Operation                          │
├────────────────────────────────────────────────────────┤
│                                                         │
│ > git fetch origin                                      │
│ From github.com:ungular/immunity-manager                │
│  * branch            main       -> FETCH_HEAD           │
│  * branch            develop    -> FETCH_HEAD           │
│  * [new branch]      feature/api-v2 -> origin/feature/..│
│                                                          │
│ ✅ Fetch completed successfully                         │
│ Updated 3 remote branches                               │
│ Downloaded 5 new commits                                │
│                                                          │
└────────────────────────────────────────────────────────┘
```

### Step 2: Checkout Feature Branch

**Action:** Switch to your feature branch

```
VCS → Git → Branches → Right-click feature branch → Checkout
```

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────┐
│ Git Branches Panel                                   │
├──────────────────────────────────────────────────────┤
│ 📁 Local Branches                                    │
│  ├─ main                                             │
│  ├─ ✓ feature/user-auth        ← Current branch     │
│  └─ bugfix/ui-crash                                  │
│                                                       │
│ 📁 Remote Branches                                   │
│  ├─ origin/main                                      │
│  └─ origin/feature/user-auth                         │
│                                                       │
│ Status: Checked out branch 'feature/user-auth'      │
│                                                       │
└──────────────────────────────────────────────────────┘
```

### Step 3: Open Rebase Dialog

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│                 Git Rebase Dialog                       │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ☐ Interactive                                          │
│  ☑ Preserve merges            ← Can be useful         │
│  ☐ Dry run                                              │
│                                                         │
│  Onto:  [origin/main                          ] ▼       │
│           ├─ origin/main          ← SELECT THIS         │
│           ├─ origin/develop                             │
│           ├─ origin/feature/api-v2                      │
│           └─ main (local)                               │
│  From:  [                                      ]        │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │ ✅ Rebase                  ❌ Cancel            │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  Current Branch: feature/user-auth                      │
│  Commits to rebase: 4                                   │
│  Target: origin/main (5 new commits since branch)      │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 4: Execution and Result

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Git Console - Rebase Execution                         │
├────────────────────────────────────────────────────────┤
│                                                         │
│ > git rebase origin/main                               │
│ Rebasing (4/4)                                          │
│ [████████████████████] 100%                            │
│                                                         │
│ Successfully rebased and updated feature/user-auth     │
│                                                         │
│ ✅ Rebase Completed                                     │
│ Your branch is now 9 commits ahead of 'origin/main'    │
│                                                         │
│ Branch Statistics:                                      │
│ ├─ Local commits: 4                                     │
│ ├─ Origin/main latest: abc1234                          │
│ ├─ Your HEAD: xyz9876                                   │
│ └─ Linear history: ✅ Yes                               │
│                                                         │
└────────────────────────────────────────────────────────┘
```

---

## Scenario 4: Handling Merge Conflicts

### Step 1: Identify Conflicts

**Action:** Rebase detects and stops at conflicted commit

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Conflict Notification (Top Right)                      │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ⚠️  Conflicts During Rebase                           │
│                                                         │
│  Conflict in: src/auth/LoginScreen.kt                  │
│              src/api/ApiClient.kt                      │
│                                                         │
│  Conflicted Files: 2/15                                │
│  Status: REBASE IN PROGRESS                            │
│                                                         │
│  [Resolve Conflicts]  [Abort Rebase]                   │
│                                                         │
└────────────────────────────────────────────────────────┘

┌────────────────────────────────────────────────────────┐
│ Project Tree - Conflict Indicators                     │
├────────────────────────────────────────────────────────┤
│ 📁 src                                                  │
│  ├─ 📁 auth                                             │
│  │  ├─ 🔴 LoginScreen.kt              ← Red = Conflict │
│  │  └─ AuthViewModel.kt                                │
│  ├─ 📁 api                                              │
│  │  ├─ 🔴 ApiClient.kt                ← Red = Conflict │
│  │  └─ ApiRequest.kt                                   │
│  └─ 📁 ui                                               │
│     └─ MainActivity.kt                                  │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 2: Open Merge Conflict Resolver

**Action:** Click on conflicted file to open 3-way merge view

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Three-Way Merge View                                         │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ File: LoginScreen.kt                                         │
│ Status: ⚠️  Has Conflicts                                     │
│                                                               │
│ ┌─────────────────┬──────────────────┬─────────────────┐    │
│ │  YOUR CHANGES   │   MERGE RESULT   │ INCOMING (MAIN) │    │
│ │  (Current)      │   (Editable)     │ (origin/main)   │    │
│ ├─────────────────┼──────────────────┼─────────────────┤    │
│ │                 │                  │                 │    │
│ │ fun loginUser( │ fun loginUser(   │ fun loginUser( │    │
│ │   email: String│   email: String, │   email: String,│    │
│ │   password: Str│   password: Str, │   password: Str,│    │
│ │ ): Boolean {   │   timestamp: Long │ ): Boolean {   │    │
│ │   return auth  │ ): Boolean {      │   validateEmail │    │
│ │   .login(email │   validateEmail( │   (email)       │    │
│ │   , password)  │     email        │   return auth   │    │
│ │ }              │   )              │   .login(email) │    │
│ │                │   return auth    │ }               │    │
│ │                │   .login(        │                 │    │
│ │                │     email,       │                 │    │
│ │                │     timestamp    │                 │    │
│ │                │   )              │                 │    │
│ │                │ }                │                 │    │
│ │                │                  │                 │    │
│ ├─────────────────┼──────────────────┼─────────────────┤    │
│ │ [✅ Accept Yours] [Accept Both] [Accept Theirs] [Edit]│    │
│ └─────────────────┴──────────────────┴─────────────────┘    │
│                                                               │
│ Legend:                                                       │
│  • Green background = Accepted changes                        │
│  • Blue background = Conflicting section                      │
│  • Gray background = Unchanged code                           │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 3: Resolution Options

#### Option A: Accept Your Changes

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Three-Way Merge View - After "Accept Yours"                 │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ Conflict Resolved: Your version kept                         │
│                                                               │
│ fun loginUser(                                                │
│   email: String                                               │
│   password: String                                            │
│ ): Boolean {                                                  │
│   return auth.login(email, password)  ✅ Your version        │
│ }                                                              │
│                                                               │
│ Conflict Resolution: ✅ ACCEPTED YOURS (50%)                │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

#### Option B: Accept Incoming Changes

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Three-Way Merge View - After "Accept Theirs"                │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ Conflict Resolved: Their version kept                        │
│                                                               │
│ fun loginUser(                                                │
│   email: String,                                              │
│   password: String,                                           │
│ ): Boolean {                                                  │
│   validateEmail(email)                                        │
│   return auth.login(email)  ✅ Their version (from main)     │
│ }                                                              │
│                                                               │
│ Conflict Resolution: ✅ ACCEPTED THEIRS (50%)               │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

#### Option C: Accept Both Changes

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Three-Way Merge View - After "Accept Both"                  │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ Conflict Resolved: Both versions combined                    │
│                                                               │
│ fun loginUser(                                                │
│   email: String,                                              │
│   password: String,                                           │
│   timestamp: Long                      ✅ From their version  │
│ ): Boolean {                                                  │
│   validateEmail(email)                 ✅ From their version  │
│   return auth.login(email, password)   ✅ From your version   │
│ }                                                              │
│                                                               │
│ Conflict Resolution: ✅ ACCEPTED BOTH (100%)                │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

#### Option D: Manual Resolution

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────────┐
│ Manual Merge Resolution                                      │
├──────────────────────────────────────────────────────────────┤
│                                                               │
│ Click in center panel to manually edit:                      │
│                                                               │
│ fun loginUser(                                                │
│   email: String,                                              │
│   password: String,                                           │
│   timestamp: Long = System.currentTimeMillis()               │
│ ): Boolean {                                                  │
│   // Validate both email and password                         │
│   if (!validateEmail(email)) return false                     │
│   if (password.length < 8) return false                       │
│                                                               │
│   // Call API with all parameters                             │
│   return auth.login(email, password, timestamp)               │
│ }                                                              │
│                                                               │
│ ✏️  Manually merged: Took best from both sides               │
│ Conflict Markers Removed: ✅ Yes                             │
│                                                               │
└──────────────────────────────────────────────────────────────┘
```

### Step 4: Mark as Resolved

**Action:** After resolving, mark the file as resolved

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Conflict Resolution UI                                 │
├────────────────────────────────────────────────────────┤
│                                                         │
│ File: LoginScreen.kt                                   │
│ Status: ⚠️  Manually Resolved                          │
│                                                         │
│  Changes:                                               │
│  ✅ Merged login function signature                     │
│  ✅ Combined validation logic                           │
│  ✅ Added timestamp parameter with default              │
│                                                         │
│  ┌────────────────────────────────────────┐            │
│  │ ✓ Mark as Resolved                     │            │
│  │ 🔄 Undo Changes                        │            │
│  │ 📋 Show Diff                           │            │
│  └────────────────────────────────────────┘            │
│                                                         │
│ [Continue Rebase]  [Abort Rebase]                       │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 5: Continue Rebase

**Action:** After all conflicts resolved, continue rebase

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Git Console - Continuing Rebase                        │
├────────────────────────────────────────────────────────┤
│                                                         │
│ > git rebase --continue                                │
│                                                         │
│ Rebasing (2/4)                                          │
│ [████████░░░░░░░░░░░░] 50%                             │
│                                                         │
│ [1/4] ✅ Applying: Add user authentication             │
│ [2/4] ✅ Applying: Update login validation             │
│           └─ Resolved 2 conflicts                       │
│ [3/4] ⏳ Applying: Fix API client                      │
│ [4/4] ⏳ Pending...                                     │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 6: Multiple Conflicts

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Multiple Conflict Resolution Progress                  │
├────────────────────────────────────────────────────────┤
│                                                         │
│ Rebasing Progress:                                      │
│                                                         │
│ Conflict 1/2:                                           │
│ File: LoginScreen.kt                                    │
│ Status: ✅ RESOLVED                                     │
│                                                         │
│ Conflict 2/2:                                           │
│ File: ApiClient.kt                                      │
│ Status: ⏳ CURRENT                                      │
│ ├─ Line 45: Method signature mismatch                  │
│ ├─ Line 67: Parameter addition                         │
│ └─ Line 89: Return type difference                      │
│                                                         │
│ Conflicts Remaining: 1                                  │
│                                                         │
│ [Resolve Next]  [View All]                             │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 7: Final Completion

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Conflict Resolution Complete                           │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ✅ All Conflicts Resolved                             │
│                                                         │
│  Summary:                                               │
│  ├─ Files processed: 2                                  │
│  ├─ Conflicts resolved: 2                               │
│  ├─ Manual edits: 1                                     │
│  └─ Rebase status: SUCCESS                              │
│                                                         │
│  Rebasing (4/4)                                         │
│  [████████████████████] 100%                            │
│                                                         │
│  > git rebase --continue                                │
│  Successfully rebased and updated feature/user-auth     │
│                                                         │
│  ✅ Rebase Completed Successfully                       │
│                                                         │
│  [View History]  [Close]                               │
│                                                         │
└────────────────────────────────────────────────────────┘
```

---

## Scenario 5: Rebase Abort and Recovery

### Step 1: Abort Current Rebase

**Action:** Cancel rebase in progress

```
Menu Path: VCS → Git → Rebase → Abort Rebase
```

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ VCS Menu - During Rebase                               │
├────────────────────────────────────────────────────────┤
│                                                         │
│ Git                                                     │
│  ├─ Commit...                                           │
│  ├─ Push...                                             │
│  ├─ Rebase...                                           │
│  │  ├─ Abort Rebase              ◄─── CLICK THIS      │
│  │  └─ Continue Rebase                                 │
│  ├─ Merge...                                            │
│  └─ ...                                                 │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 2: Confirmation Dialog

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Abort Rebase Confirmation                              │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ⚠️  Are you sure you want to abort rebase?            │
│                                                         │
│  Current Status:                                        │
│  • Branch: feature/user-auth                            │
│  • Commits processed: 2/4                               │
│  • Conflicts: 1 unresolved                              │
│  • Changes will be DISCARDED                            │
│                                                         │
│  After abort:                                           │
│  • Your branch will return to pre-rebase state          │
│  • Working directory will be restored                   │
│  • No commits will be lost                              │
│                                                         │
│  ┌────────────────────────────────────────┐            │
│  │ ✅ Yes, Abort      ❌ Cancel, Continue │            │
│  └────────────────────────────────────────┘            │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 3: Abort Success

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Rebase Aborted Successfully                            │
├────────────────────────────────────────────────────────┤
│                                                         │
│  ✅ Rebase Aborted                                      │
│                                                         │
│  Status:                                                │
│  • Branch: feature/user-auth (back to original state)  │
│  • HEAD: xyz1234 (before rebase)                        │
│  • Working directory: CLEAN                             │
│  • Rebase in progress: ❌ NO                             │
│                                                         │
│  Git Console Output:                                    │
│  > git rebase --abort                                   │
│  ✅ Rebase aborted                                      │
│                                                         │
│  Your branch is back to pre-rebase condition            │
│                                                         │
│  [View History]  [Close]                               │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 4: Recovery with Git Reflog

**Action:** Recover from failed rebase using terminal

**Screenshot Description:**
```
┌────────────────────────────────────────────────────────┐
│ Terminal - Git Reflog                                  │
├────────────────────────────────────────────────────────┤
│                                                         │
│ $ git reflog                                            │
│ xyz1234 (HEAD -> feature/user-auth) HEAD@{0}: rebase   │
│ abc5678 HEAD@{1}: rebase: Add user authentication      │
│ def9012 HEAD@{2}: checkout: moving from main to feat..│
│ ghi3456 HEAD@{3}: commit: Update API endpoints         │
│ jkl7890 HEAD@{4}: commit: Fix login validation         │
│ mno1234 HEAD@{5}: commit: Add user authentication      │
│                                                         │
│ $ git reset --hard HEAD@{5}                             │
│ HEAD is now at mno1234 Add user authentication         │
│                                                         │
│ ✅ Successfully recovered to commit mno1234            │
│                                                         │
└────────────────────────────────────────────────────────┘
```

### Step 5: Using Git History GUI

**Action:** Visual recovery using Android Studio's Git History

**Screenshot Description:**
```
┌──────────────────────────────────────────────────────────┐
│ Git Log / History View                                   │
├──────────────────────────────────────────────────────────┤
│                                                           │
│ ✓ feature/user-auth                                      │
│                                                           │
│ Commit      │ Author          │ Date        │ Message    │
│─────────────┼─────────────────┼─────────────┼────────────│
│ xyz1234 ... │ Your Name       │ Now         │ Rebase... │
│ abc5678 ... │ Your Name       │ 10 min ago  │ Rebase... │
│ def9012 ... │ Your Name       │ 20 min ago  │ Checkout  │
│ ghi3456 ... │ Your Name       │ 1 hour ago  │ Update API│
│ jkl7890 ... │ Your Name       │ 2 hours ago │ Fix login │
│ mno1234 ... │ Your Name       │ 3 hours ago │ Add auth  │◄─
│                                                           │
│ (Right-click on any commit)                              │
│ ┌──────────────────────────────────────────────┐        │
│ │ Reset Current Branch to Here                 │        │
│ │ ├─ Soft (keep changes)                       │        │
│ │ ├─ Mixed (index to working)                  │        │
│ │ └─ Hard (discard all)                        │        │
│ └──────────────────────────────────────────────┘        │
│                                                           │
└──────────────────────────────────────────────────────────┘
```

---

## Best Practices

### ✅ Do's

1. **Always fetch first** before rebasing
   ```bash
   git fetch origin
   ```

2. **Rebase local branches only**
   - Never rebase shared/published branches
   - Only rebase branches you haven't pushed or only you're using

3. **Use interactive rebase to clean history**
   - Before creating a pull request
   - Squash work-in-progress commits
   - Fix commit messages

4. **Test after rebase**
   - Run tests to ensure nothing broke
   - Build the project
   - Verify functionality

5. **Document your changes**
   - Use meaningful commit messages
   - Reference issue numbers when applicable

### ❌ Don'ts

1. **Don't rebase public branches**
   - Main, master, develop (shared branches)
   - Results in history conflicts for team members

2. **Don't force push to shared branches**
   - Use `git push --force-with-lease` with caution
   - Communicate with your team first

3. **Don't ignore conflicts**
   - Resolve them properly, don't just accept one side
   - Understand what the conflict means

4. **Don't rebase large feature branches without testing**
   - Complex rebases can introduce subtle bugs
   - Always test thoroughly afterward

---

## Troubleshooting

### Problem 1: "fatal: No rebase in progress"

**Cause:** Trying to continue/abort a rebase when none is running

**Solution:**
1. Check git status: Terminal → `git status`
2. Ensure you're in the correct directory
3. If rebase already completed, start fresh rebase if needed

### Problem 2: "Detached HEAD" After Rebase

**Cause:** Rebase left you in detached HEAD state

**Solution:**
1. Go to **VCS** → **Git** → **Branches**
2. Checkout your feature branch
3. Continue working normally

### Problem 3: Rebase Conflicts Keep Appearing

**Cause:** Incomplete conflict resolution or complex history

**Solution:**
1. Carefully review the conflict markers
2. Understand what each side represents
3. Use the three-way merge view to compare
4. If overwhelming, abort and use merge instead

### Problem 4: Lost Commits After Rebase

**Cause:** Commits appear to be gone after rebase

**Solution:**
1. Don't panic - use git reflog
2. Terminal: `git reflog`
3. Find your commits: `git show HEAD@{n}`
4. Reset if needed: `git reset --hard HEAD@{n}`

### Problem 5: "Permission denied" When Rebasing

**Cause:** SSH key issues or authentication problems

**Solution:**
1. Check SSH configuration
2. Go to **File** → **Settings** → **Version Control** → **Git**
3. Verify SSH executable path
4. Try HTTPS instead if available

---

## Quick Reference Cheat Sheet

### Common Rebase Scenarios

| Scenario | Steps |
|----------|-------|
| **Simple Rebase** | VCS → Git → Rebase → Select Onto Branch → Click Rebase |
| **Interactive Rebase** | VCS → Git → Rebase → Check Interactive → Modify Commands → Save |
| **Squash Commits** | Interactive Rebase → Change `pick` to `squash` → Save |
| **Reword Commits** | Interactive Rebase → Change `pick` to `reword` → Edit Messages |
| **Resolve Conflicts** | Double-click file → Use merge resolver → Mark resolved → Continue |
| **Abort Rebase** | VCS → Git → Rebase → Abort Rebase → Confirm |

---

## Git Rebase Command Reference

For those who prefer terminal alongside GUI:

```bash
# Simple rebase
git rebase origin/main

# Interactive rebase
git rebase -i origin/main

# Interactive rebase from 3 commits back
git rebase -i HEAD~3

# Continue after resolving conflicts
git rebase --continue

# Abort current rebase
git rebase --abort

# Skip current commit
git rebase --skip

# Rebase onto a specific commit
git rebase --onto new-base upstream-branch branch
```

---

## Summary

Git rebase is a powerful tool that:
- Keeps commit history clean and linear
- Allows reorganization of commits before merging
- Requires careful conflict resolution
- Should only be used on local branches

With Android Studio's GUI tools, rebasing becomes intuitive and safer:
- Visual conflict resolution with three-way merge view
- Step-by-step guidance for interactive operations
- Easy abort options for recovery
- Integration with project structure

Master these scenarios, follow best practices, and you'll dramatically improve your Git workflow!

---

## Additional Resources

- [Git Official Rebase Documentation](https://git-scm.com/docs/git-rebase)
- [Atlassian Rebase Tutorial](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)
- [Android Studio VCS Documentation](https://developer.android.com/studio/intro)
- [GitHub Flow Guide](https://guides.github.com/introduction/flow/)

---

**Last Updated:** August 2026
**Author:** GitHub Copilot
**License:** Creative Commons CC-BY-4.0

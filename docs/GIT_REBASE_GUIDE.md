# How to Git Rebase in Android Studio with GUI - Complete Tutorial

A comprehensive guide to mastering Git rebase operations using Android Studio's built-in GUI tools. This tutorial covers all scenarios and workflows.

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

1. Go to **VCS** (Version Control System) menu in Android Studio
2. Select **Git** → **Branches**
   
**Visual Guide:** This opens the branches panel showing all local and remote branches.

### Step 2: Navigate to Your Feature Branch

1. In the Branches panel (usually right side)
2. Locate your feature branch
3. Right-click on it and select **Checkout**

### Step 3: Open Rebase Dialog

1. Go to **VCS** → **Git** → **Rebase**

### Step 4: Configure Rebase Settings

1. **Onto** field: Select the branch you want to rebase onto (e.g., `origin/main`)
2. **From** field: Usually empty (rebases current branch)
3. Click **Rebase**

### Step 5: Monitor Progress

Android Studio shows the rebase progress in the Git pane:
- ✅ Commits being replayed
- Shows percentage completion
- Displays current commit information

### Step 6: Completion

When successful, you'll see:
- "Rebase completed successfully" message
- Your branch now has the latest commits from main
- History is linear

---

## Scenario 2: Interactive Rebase

Interactive rebase allows you to modify commits during the rebase process.

### Step 1: Open Interactive Rebase

1. Go to **VCS** → **Git** → **Rebase**
2. Check the **Interactive** checkbox
3. Specify your **Onto** branch

### Step 2: Rebase Interactive Editor Opens

The editor shows all commits to be rebased:

```
pick 12a3b4c Add feature A
pick 45d6e7f Add feature B
pick 78g9h0i Fix bug in feature B

# Rebase abc1234..78g9h0i onto abc1234 (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <commit> = label current HEAD with a name
# t, reset <commit> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# u, update-ref <ref>
```

### Step 3: Choose Your Action

#### Example 1: Squash Commits

Replace `pick` with `squash` (or `s`) for commits you want to combine:

```
pick 12a3b4c Add feature A
squash 45d6e7f Add feature B
squash 78g9h0i Fix bug in feature B
```

**Result:** All three commits merge into one with a combined message.

#### Example 2: Reword Commits

Replace `pick` with `reword` (or `r`) to edit commit messages:

```
reword 12a3b4c Add feature A
pick 45d6e7f Add feature B
```

**Result:** You'll be prompted to edit the message for the first commit.

#### Example 3: Drop Commits

Replace `pick` with `drop` (or `d`) to remove commits:

```
pick 12a3b4c Add feature A
drop 45d6e7f Add feature B
pick 78g9h0i Fix bug
```

**Result:** The second commit is completely removed from history.

### Step 4: Save and Continue

1. Save the interactive rebase editor file
2. Android Studio processes each action in sequence
3. For each `reword`, you'll be prompted to edit the message

### Step 5: Completion

When all actions complete:
- Your commits are reorganized as specified
- Linear history is maintained
- Branch is ready for review/merge

---

## Scenario 3: Rebase onto Master/Main

This scenario handles rebasing your feature branch onto the latest main branch.

### Step 1: Fetch Latest Changes

1. Go to **VCS** → **Git** → **Fetch**
2. Or press **Ctrl+Shift+K** (Cmd+Shift+K on Mac)

This ensures you have the latest main branch commits.

### Step 2: Switch to Feature Branch

1. Go to **VCS** → **Git** → **Branches**
2. Find your feature branch
3. Right-click and select **Checkout**

### Step 3: Open Rebase Dialog

1. **VCS** → **Git** → **Rebase**
2. In the **Onto** field, select your main branch (usually `origin/main` or `origin/master`)

### Step 4: Configure Additional Options

- **Interactive**: Uncheck unless you need to modify commits
- **Preserve merges**: Check if you have merge commits to preserve
- **Dry run**: Check to preview without applying (optional)

### Step 5: Execute Rebase

Click **Rebase** button. Android Studio will:
1. Apply your commits on top of main
2. Show progress bar
3. Detect any conflicts automatically

### Step 6: Verify Result

After completion, you'll see:
- Feature branch is now up-to-date with main
- All your commits are preserved
- Linear commit history

---

## Scenario 4: Handling Merge Conflicts

Conflicts occur when the same lines are modified in both branches.

### Step 1: Identify Conflicts

During rebase, Android Studio stops and shows:
- Red X icon on the conflicted file
- Conflict markers in the code
- Notification popup

### Step 2: Open Merge Conflict Resolver

1. Click on the conflicted file in the editor
2. Or go to **VCS** → **Git** → **Resolve Conflicts**

Android Studio's three-way merge view shows:
- **Left panel**: Your changes (current branch)
- **Center panel**: Merged result (editable)
- **Right panel**: Incoming changes (branch being rebased onto)

### Step 3: Resolve Using GUI

#### Option A: Accept Your Changes
- Click **Accept Yours** button (left side)
- Keeps your version

#### Option B: Accept Incoming Changes
- Click **Accept Theirs** button (right side)
- Takes their version

#### Option C: Accept Both Changes
- Click **Accept Both** button
- Merges both versions

#### Option D: Manual Resolution
1. Click in the **center panel** (merge result)
2. Edit the code directly to resolve the conflict
3. Remove conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)

### Step 4: Mark as Resolved

After resolving the conflict:
1. The file should show no conflict markers
2. Click the **✓ Mark as Resolved** button

### Step 5: Continue Rebase

1. After all conflicts are resolved, click **VCS** → **Git** → **Continue Rebase**
2. Or use the notification popup with the **Continue** button

### Step 6: Handle Multiple Conflicts

If there are more conflicted commits:
1. Repeat steps 2-5 for each conflict
2. Android Studio will guide you through each one sequentially

### Step 7: Final Completion

When all conflicts are resolved:
- Rebase completes successfully
- All commits are applied
- Clean merge history

---

## Scenario 5: Rebase Abort and Recovery

Sometimes you need to abort or recover from a failed rebase.

### Step 1: Abort Current Rebase

If you're in the middle of a rebase and want to cancel:

1. Go to **VCS** → **Git** → **Rebase** → **Abort Rebase**
2. Or use command palette: **Ctrl+Shift+A** (Cmd+Shift+A on Mac) and search "abort"

### Step 2: Confirmation Dialog

Android Studio shows a confirmation:
- "Are you sure you want to abort rebase?"
- Click **Abort** to confirm

### Step 3: Verify Abort

After abort:
- Your branch returns to the state before rebase
- Working directory is restored
- No commits are lost

### Step 4: Recovery from Failed Rebase (Git Reflog)

If something goes wrong and you need to recover:

1. Open **Terminal** in Android Studio (**View** → **Tool Windows** → **Terminal**)
2. Run: `git reflog`
3. Find your previous HEAD state (usually `HEAD@{0}`, `HEAD@{1}`, etc.)
4. Run: `git reset --hard HEAD@{n}` to recover

### Step 5: Using Git History in Android Studio

Alternative method using GUI:

1. Go to **VCS** → **Git** → **Show History**
2. Find your desired commit
3. Right-click → **Reset Current Branch to Here**
4. Select **Hard** reset

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
- Visual conflict resolution
- Step-by-step guidance
- Easy abort options
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

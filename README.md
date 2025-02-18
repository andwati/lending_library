# **Library Lending System**  

## **Project Overview**  
The Library Lending System is a **Ruby on Rails** web application that allows users to:  
- **Manage books** (create, update, delete, view).  
- **Borrow books** with a specified duration.  
- **Return books** and calculate penalties for overdue returns.  
- **View borrowing and return history** for users and books.  

This project follows the **MVC pattern** and uses **ERB templates** for the frontend.

---

# **1️⃣ System Requirements**  
Before setting up the project, ensure you have the following installed:  

### ✅ **Ruby & Rails Versions used**
- **Ruby**: `3.4.2`  
- **Rails**: `8.0.1`  

### ✅ **Other Dependencies**
- **Bundler** (for managing gems)
- **SQLite3** (default database) or PostgreSQL (optional)


---

# **2️⃣ Project Setup**

### 📌 **Step 1: Clone the Repository**
```sh
git clone https://github.com/yourusername/library-lending-system.git
cd library-lending-system
```

### 📌 **Step 2: Install Dependencies**
Run the following to install all required gems:
```sh
bundle install
```

### 📌 **Step 3: Configure Database**
By default, the project uses **SQLite3**. If you want to use PostgreSQL, modify `config/database.yml`.  

Then, create and migrate the database:
```sh
rails db:create db:migrate
```

If you need seed data, run:
```sh
rails db:seed
```

### 📌 **Step 4: Start the Rails Server**
```sh
rails server
```
Visit `http://localhost:3000` in your browser.

---

# **3️⃣ Application Features**
### ✅ **Book Management**
- Add new books.
- Edit or delete existing books.
- View details of a specific book.

### ✅ **Borrowing System**
- Users can borrow books for a specified duration.
- The due date is automatically calculated.

### ✅ **Return System**
- Users return books.
- Overdue books incur a penalty.

### ✅ **History Tracking**
- View all books borrowed by a user.
- View the borrowing history of a specific book.
- View return history for a user or book.

---

# **4️⃣ Running Tests**
This project includes **RSpec tests** for models and controllers.

### 📌 **Step 1: Install RSpec**
```sh
rails generate rspec:install
```

### 📌 **Step 2: Run the Tests**
```sh
rspec
```

To run tests for a specific model or controller:
```sh
rspec spec/models/book_spec.rb
rspec spec/controllers/books_controller_spec.rb
```

---


# **7️⃣ Contributing**
### 🛠️ **How to Contribute**
1. Fork the repo.
2. Create a feature branch:
   ```sh
   git checkout -b feature-name
   ```
3. Make your changes.
4. Run tests:
   ```sh
   rspec
   ```
5. Commit and push:
   ```sh
   git commit -m "Added new feature"
   git push origin feature-name
   ```
6. Open a pull request.

---

# License
This project is **MIT licensed**.
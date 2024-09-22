 Assignment 1

## Course Title: Distributed Systems and Applications
**Course Code**: DSA612S  
**Assessment**: First Assignment  
**Released on**: 30/08/2024  
**Due date**: 20/09/2024 at 23h59  
**Total Marks**: 100  

---

### Question 1: Restful APIs

This question involves developing a Restful API to manage the Programme Development and Review workflow within the Programme Development Unit at Namibia University of Science and Technology (NUST). A programme consists of multiple courses and is defined by the following attributes:

- **Programme attributes**:  
  Programme code, NQF Level of Qualification, Faculty name, Department name, Programme/Qualification Title, Registration Date, and a list of courses.  
  Each course has a course name, course code, and NQF level.

The API must include the following functionalities:
1. Add a new programme.
2. Retrieve a list of all programmes.
3. Update a programme’s information using the programme code.
4. Retrieve details of a specific programme by programme code.
5. Delete a programme using the programme code.
6. Retrieve all programmes due for review.
7. Retrieve all programmes that belong to a specific faculty.

**Note**: The programme code serves as a unique identifier for each programme.

#### Deliverables:
- **Service Implementation**:
  - Add a new programme. (10 marks)
  - Retrieve a list of all programmes. (5 marks)
  - Update an existing programme’s information using the programme code. (5 marks)
  - Retrieve details of a programme by programme code. (5 marks)
  - Delete a programme by programme code. (5 marks)
  - Retrieve programmes due for review. (5 marks)
  - Retrieve all programmes in a specific faculty. (5 marks)
  
- **Client Implementation**:  
  Implement a client in Ballerina that interacts with the API. (10 marks)

---

### Question 2: Remote Invocation - Online Shopping System using gRPC

Design and implement an online shopping system using gRPC, allowing interaction for two types of users: **customer** and **admin**.

#### Operations:
1. **add_product**: The admin adds a new product with details such as name, description, price, stock quantity, SKU, and status (available/out of stock). The operation returns a unique code for the product.
2. **create_users**: Create and stream multiple users (customers or admins) to the server.
3. **update_product**: The admin updates product details.
4. **remove_product**: The admin removes a product, returning the updated product list.
5. **list_available_products**: The customer retrieves a list of all available products.
6. **search_product**: The customer searches for a product by SKU.
7. **add_to_cart**: The customer adds a product to their cart.
8. **place_order**: The customer places an order for the products in their cart.

#### Deliverables:
- **Server Implementation**:  
  Implement the server using Ballerina and gRPC to handle incoming requests.
  
- **Client Implementation**:  
  Clients should be able to connect to the server, handle user input, and perform the operations.





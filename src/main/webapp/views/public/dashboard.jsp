<%-- 
    Document   : Dashboard
    Created on : Oct 11, 2023, 10:31:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../assets/css/dashboard.css" />
        <title>Dash Board</title>
    </head>
    <body>
            <div class="sidebar">
      <div class="logo">Bird Farm Shop</div>
      <ul class="menu">
        <li class="active">
          <a href="#">
            <i class="fas fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fa-solid fa-cart-shopping"></i>
            <span>Orders</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-chart-bar"></i>
            <span>Statistics</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-briefcase"></i>
            <span>Careers</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-question-circle"></i>
            <span>FAQ</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-star"></i>
            <span>Testimonials</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class="fas fa-cog"></i>
            <span>Settings</span>
          </a>
        </li>
        <li class="logout">
          <a href="#">
            <i class="fas fa-sign-out-alt"></i>
            <span>Logout</span>
          </a>
        </li>
      </ul>
    </div>
    <div class="main--content">
      <div class="header-wrapper">
        <div class="header--title">
          <span>Primary</span>
          <h2>Dashboard</h2>
        </div>
        <div class="user--info">
          <div class="search--box">
            <i class="fa-solid fa-search"></i>
            <input type="text" placeholder="search" />
          </div>
          Tran Manh Cuong
        </div>
      </div>
      <div class="tabular--wrapper">
        <h3 class="main--title">Finance data</h3>
        <div class="table-container">
          <table>
            <thead>
              <tr>
                <th>Date</th>
                <th>Transaction Type</th>
                <th>Description</th>
                <th>Amount</th>
                <th>Category</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
              <tr>
                <tbody>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                  <tr>
                    <td>2023-05-01</td>
                    <td>Expenses</td>
                    <td>Office supplies</td>
                    <td>$250</td>
                    <td>Office Expenses</td>
                    <td>Pending</td>
                    <td><button>Edit</button></td>
                  </tr>
                </tbody>
              </tr>
            </thead>
          </table>
        </div>
      </div>
    </div>
    </body>
</html>

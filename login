<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CivicPulse Login</title>

<style>

/* BACKGROUND */
body{
  margin:0;
  font-family:'Segoe UI';
  background:linear-gradient(135deg,#fff7ed,#ffedd5);
  display:flex;
  justify-content:center;
  align-items:center;
  height:100vh;
}

/* CARD */
.card{
  background:white;
  padding:30px;
  width:350px;
  border-radius:20px;
  box-shadow:0 15px 40px rgba(0,0,0,0.2);
  text-align:center;
}

/* TITLE */
h2{
  color:#ea580c;
}

/* INPUT */
input{
  width:100%;
  padding:12px;
  margin:10px 0;
  border-radius:10px;
  border:1px solid #fdba74;
}

/* ROLE */
.role{
  padding:10px;
  margin:5px 0;
  border-radius:10px;
  background:#fff7ed;
  cursor:pointer;
}

.role.active{
  background:#fed7aa;
  border:2px solid #ea580c;
}

/* BUTTON */
button{
  width:100%;
  padding:12px;
  border:none;
  border-radius:10px;
  margin-top:10px;
  font-weight:bold;
  cursor:pointer;
}

.btn-main{
  background:#ea580c;
  color:white;
}

/* SOCIAL */
.social{
  display:flex;
  align-items:center;
  justify-content:center;
  gap:10px;
  padding:10px;
  border-radius:10px;
  border:1px solid #ddd;
  margin-top:10px;
  cursor:pointer;
}

.social img{ width:20px; }

.apple{
  background:black;
  color:white;
}

.phone{
  background:#fb923c;
  color:white;
}

.small{
  font-size:12px;
  color:gray;
}

</style>
</head>

<body>

<div class="card">

<h2>🔥 CivicPulse Login</h2>

<!-- ROLE -->
<div class="role" onclick="selectRole(this,'Citizen')">👤 Citizen</div>
<div class="role" onclick="selectRole(this,'Worker')">👷 Worker</div>
<div class="role" onclick="selectRole(this,'Admin')">👨‍💼 Admin</div>

<input id="name" placeholder="Enter Name">
<input id="phone" placeholder="Mobile Number">

<button class="btn-main" onclick="login()">Login</button>

<p class="small">or continue with</p>

<!-- GOOGLE -->
<div class="social" onclick="googleLogin()">
<img src="https://cdn-icons-png.flaticon.com/512/300/300221.png">
<span>Continue with Google</span>
</div>

<!-- APPLE -->
<div class="social apple">
<img src="https://cdn-icons-png.flaticon.com/512/0/747.png">
<span>Continue with Apple</span>
</div>

<!-- PHONE -->
<div class="social phone">
<span>📱 Continue with Mobile</span>
</div>

</div>

<script>

let selectedRole = "";

/* ROLE SELECT */
function selectRole(el,role){
 document.querySelectorAll('.role').forEach(r=>r.classList.remove('active'));
 el.classList.add('active');
 selectedRole = role;
}

/* NORMAL LOGIN */
function login(){

 let name = document.getElementById("name").value;
 let phone = document.getElementById("phone").value;

 if(!selectedRole){
  alert("Select Role!");
  return;
 }

 if(!name || !phone){
  alert("Enter details!");
  return;
 }

 // SAVE USER SESSION
 localStorage.setItem("userRole", selectedRole);
 localStorage.setItem("userName", name);

 // REDIRECT BASED ON ROLE
 if(selectedRole === "Admin"){
   window.location.href = "admin.html";
 }
 else if(selectedRole === "Worker"){
   window.location.href = "worker.html";
 }
 else{
   window.location.href = "index.html";
 }
}

/* GOOGLE LOGIN (SIMULATED) */
function googleLogin(){

 alert("⚠ Real Google login needs backend.\nNow simulating login...");

 localStorage.setItem("userRole","Citizen");
 localStorage.setItem("userName","Google User");

 window.location.href = "index.html";
}

</script>

</body>
</html>

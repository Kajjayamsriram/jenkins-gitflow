<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>NexusShop — Premium UI</title>

<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
    --primary:#0a2540;
    --accent:#00d4ff;
    --bg:#fff;
}

/* GLOBAL */
body{
    margin:0;
    font-family:Inter;
    background:var(--bg);
}
button,a{transition:.2s}

/* HEADER GLASS */
header{
    position:sticky;
    top:0;
    backdrop-filter:blur(12px);
    background:rgba(255,255,255,0.6);
    border-bottom:1px solid rgba(0,0,0,0.05);
    z-index:100;
}
.container{max-width:1200px;margin:auto;padding:10px}

/* NAV */
nav a{
    margin:0 10px;
    position:relative;
}
nav a::after{
    content:"";
    position:absolute;
    bottom:-3px;
    left:50%;
    width:0%;
    height:2px;
    background:var(--accent);
    transform:translateX(-50%);
    transition:.3s;
}
nav a:hover::after{width:80%}

/* HERO */
.hero{
    height:400px;
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    text-align:center;
    background:url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1400&q=80') center/cover;
    position:relative;
}
.hero::before{
    content:"";
    position:absolute;
    width:500px;
    height:500px;
    background:radial-gradient(circle, rgba(0,212,255,.4), transparent);
    top:-100px;
    left:-100px;
    animation:float 6s infinite;
}
@keyframes float{
    50%{transform:translateY(30px)}
}

/* BUTTON */
.btn{
    padding:10px 20px;
    border:none;
    border-radius:50px;
    background:linear-gradient(135deg,#00d4ff,#0077ff);
    color:white;
    cursor:pointer;
}

/* PRODUCTS */
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.product{
    background:#fff;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,.05);
    transition:.3s;
}
.product:hover{
    transform:translateY(-10px) scale(1.02);
    box-shadow:0 20px 50px rgba(0,0,0,.1);
}
.product img{
    width:100%;
    height:200px;
    object-fit:cover;
    transition:.4s;
}
.product:hover img{transform:scale(1.1)}

/* CATEGORY */
.cat{
    padding:20px;
    text-align:center;
    border-radius:10px;
    background:#fff;
}
.cat:hover{
    background:linear-gradient(135deg,#fff,#f0fbff);
    border:1px solid rgba(0,212,255,.2);
}

/* SCROLL BUTTON */
#scrollTop{
position:fixed;
bottom:20px;
right:20px;
background:#00d4ff;
color:white;
border:none;
padding:12px;
border-radius:50%;
display:none;
cursor:pointer;
}
</style>
</head>

<body>

<header>
<div class="container" style="display:flex;justify-content:space-between;">
<h2>Nexus<span style="color:#00d4ff">Shop</span></h2>
<nav>
<a href="#">Home</a>
<a href="#">Products</a>
<a href="#">Deals</a>
</nav>
</div>
</header>

<!-- HERO -->
<section class="hero">
<div>
<h1>Premium Shopping Experience</h1>
<button class="btn">Shop Now</button>
</div>
</section>

<!-- CATEGORIES -->
<div class="container">
<h2>Categories</h2>
<div class="grid">
<div class="cat">Phones</div>
<div class="cat">Laptops</div>
<div class="cat">Shoes</div>
<div class="cat">Accessories</div>
</div>
</div>

<!-- PRODUCTS -->
<div class="container">
<h2>Products</h2>
<div class="grid" id="products"></div>
</div>

<button id="scrollTop">↑</button>

<script>

/* DATA */
const PRODUCTS=[
{ id:1,title:"iPhone",img:"https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb" },
{ id:2,title:"MacBook",img:"https://images.unsplash.com/photo-1593642632823" },
{ id:3,title:"Shoes",img:"https://images.unsplash.com/photo-1542272604" }
];

/* RENDER */
const grid=document.getElementById("products");

PRODUCTS.forEach(p=>{
let el=document.createElement("div");
el.className="product";
el.innerHTML=`
<img src="${p.img}">
<div style="padding:10px">
<h4>${p.title}</h4>
<button class="btn add" data-id="${p.id}">Add to Cart</button>
</div>`;
grid.appendChild(el);
});

/* CART ANIMATION */
document.querySelectorAll(".add").forEach(btn=>{
btn.onclick=()=>{
const circle=document.createElement("div");
circle.style.position="fixed";
circle.style.width="20px";
circle.style.height="20px";
circle.style.background="#00d4ff";
circle.style.borderRadius="50%";
circle.style.left=btn.getBoundingClientRect().left+"px";
circle.style.top=btn.getBoundingClientRect().top+"px";

document.body.appendChild(circle);

circle.animate([
{transform:'translate(0,0)'},
{transform:'translate(300px,-300px)'}
],{duration:800});

setTimeout(()=>circle.remove(),800);
};
});

/* SCROLL TOP */
const scrollBtn=document.getElementById("scrollTop");

window.onscroll=()=>{
scrollBtn.style.display=window.scrollY>300?'block':'none';
};

scrollBtn.onclick=()=>{
window.scrollTo({top:0,behavior:'smooth'});
};

/* SCROLL ANIMATION */
const observer=new IntersectionObserver(entries=>{
entries.forEach(e=>{
if(e.isIntersecting){
e.target.style.opacity=1;
e.target.style.transform='translateY(0)';
}
});
});

document.querySelectorAll(".product,.cat").forEach(el=>{
el.style.opacity=0;
el.style.transform='translateY(40px)';
observer.observe(el);
});

</script>

</body>
</html>

# 📚 BookNook — Online Bookstore E-Commerce Website

> *"A cozy corner for every reader"*

[![PRD Version](https://img.shields.io/badge/PRD-v1.0-2D6A4F?style=flat-square)](PRD.pdf)
[![Stack](https://img.shields.io/badge/Stack-HTML5%20%7C%20CSS3%20%7C%20JavaScript-2D6A4F?style=flat-square)](#tech-stack)
[![Design](https://img.shields.io/badge/Palette-Forest%20Green%20%26%20Cream-2D6A4F?style=flat-square)](#design-system)
[![Status](https://img.shields.io/badge/Acceptance%20Criteria-100%25%20Passed-10B981?style=flat-square)](#acceptance-criteria-verification)

---

## 1. Project Overview

**BookNook** is a comprehensive, frontend-only online bookstore and stationery atelier designed to evoke the warmth, intellectual charm, and tactile joy of a beloved neighbourhood bookshop. 

Readers can effortlessly explore masterworks of literature, bestselling non-fiction, whimsical children’s tales, and heirloom stationery across **4 main categories** and **20 sub-categories**, with a full shopping cart, live pricing breakdown, interactive filters, simulated authentication, customer reviews, order tracking timeline, and gift wrapping.

All state (catalogue, cart, wishlist, customer reviews, saved addresses, order history, and user authentication) is persisted in browser `localStorage`.

---

## 2. Palette & Design System (PRD Section 9)

| Token | Hex Code | Usage |
|---|---|---|
| **Forest Green (Primary)** | `#2D6A4F` | Header accent, primary buttons, price tags, active states |
| **Forest Dark** | `#1B4332` | Top promo strip, footer, typography headings |
| **Cream (Background)** | `#FDF6E3` | Warm page and section backgrounds |
| **Cream Dark** | `#F4EBD9` | Badges, card borders, subtle hover tints |
| **White** | `#FFFFFF` | Product cards, modal dialogs, form containers |
| **Amber / Gold** | `#F59E0B` / `#D4A373` | Review stars, bestseller badges, hallmarks |
| **Terracotta Accent** | `#E76F51` | Wishlist heart indicators, discount badges |

- **Typography**: Scholarly serif headings (`Playfair Display`, `Georgia`) paired with ultra-clean modern body text (`Plus Jakarta Sans`, sans-serif).
- **Vibe**: Cozy, intellectual, bookish: soft shadows, rounded corners, subtle embossed borders, generous whitespace.
- **Responsiveness**: Fully responsive from **320px to 1920px** with mobile-first breakpoints (480px, 768px, 1024px, 1280px) and no horizontal scroll.

---

## 3. Site Map & Core Pages (10 Pages)

| Page | File | Description |
|---|---|---|
| **Home** | `index.html` | Hero spotlight banner, department tiles, bestsellers, new arrivals, quotes, benefits |
| **Catalogue** | `books.html` | 44+ books grid, category/subcategory filter, price range slider, rating filter, author filter, sorting, load more |
| **Product Detail** | `book.html?id=` | Large book cover, synopsis, publishing specs, rating breakdown, simulated review submission, related books, add to cart & wishlist |
| **Shopping Cart** | `cart.html` | Cart items table, quantity controls (+/-/remove), free shipping threshold progress, deluxe gift wrapping toggle & custom note |
| **Checkout** | `checkout.html` | Address form validation, payment method selector (COD, UPI, Card), order summary recap, modal confirmation with generated Order ID |
| **User Account** | `account.html` | Order history, 5-stage status timeline tracking (`Placed` → `Packed` → `Shipped` → `Out for delivery` → `Delivered`), saved address manager (add/edit/delete), wishlist manager |
| **Login / Register** | `login.html` | Simulated localStorage authentication, form validation, show/hide password, one-click demo credentials |
| **About Us** | `about.html` | BookNook story, core mission & values, team curator profiles, reading-themed hero graphic |
| **Contact Us** | `contact.html` | Physical address, phone, email, visiting hours, stylized interactive map, validated contact form |
| **Author Page** | `author.html?id=` | Author biography, origin pill, portrait, and bibliographic list of their works (Bonus F13) |

---

## 4. Feature Requirements Checklist (PRD Section 8)

| ID | Feature | Priority | Implementation Status | Notes |
|---|---|---|---|---|
| **F1** | Category-wise display | **P0** | ✅ Complete | Fiction, Non-Fiction, Children's Books, Stationery + 20 sub-categories |
| **F2** | Book search with autocomplete | **P0** | ✅ Complete | Instant suggestion dropdown in header search searching title, author, category, ISBN |
| **F3** | Add to cart | **P0** | ✅ Complete | Available from listing cards, quick view, and detail page; updates header count badge |
| **F4** | Quantity adjustment | **P0** | ✅ Complete | Steppers on cart & detail page with inventory stock upper bound |
| **F5** | Price calculation live | **P0** | ✅ Complete | Real-time recalculation of subtotal, shipping, 5% GST tax, gift wrap, and total |
| **F6** | Order summary | **P0** | ✅ Complete | Itemized summary on cart and checkout pages |
| **F7** | Checkout process | **P0** | ✅ Complete | Address validation (Phone, PIN code regex), COD/UPI/Card options, order confirmation screen |
| **F8** | Login / Register | **P0** | ✅ Complete | Client-side validation, password toggles, localStorage persistence |
| **F9** | Product filters | **P1** | ✅ Complete | Category, subcategory, author, price slider, rating radio, language checkboxes |
| **F10** | Wishlist | **P1** | ✅ Complete | Heart toggle on all book cards, badge count, manage in Account, move-to-cart |
| **F11** | Reviews & Ratings | **P1** | ✅ Complete | Star ratings, customer breakdown, interactive form allowing visitors to submit reviews |
| **F12** | Related books | **P1** | ✅ Complete | Dynamic recommendation algorithm by category and author on detail page |
| **F13** | Author pages | **P2** | ✅ Complete | Author bio, photo, and list of their books (`author.html?id=...`) |
| **F14** | Gift wrapping | **P2** | ✅ Complete | Optional ₹40 gift wrapping toggle with custom handwritten message input |
| **F15** | Order tracking | **P2** | ✅ Complete | 5-step status timeline modal (`Placed` → `Packed` → `Shipped` → `Out for delivery` → `Delivered`) |

---

## 5. Seed Catalogue & Data Model (44 Products)

The catalogue contains **44 beautifully rendered products** (11 per main category, spanning all 20 sub-categories):

1. **Fiction** (11 items)
   - *Literary Fiction*: The Midnight Library, Where the Crawdads Sing
   - *Mystery & Thriller*: The Silent Patient, The Thursday Murder Club
   - *Science Fiction*: Project Hail Mary, Dune
   - *Fantasy*: The Name of the Wind, The Priory of the Orange Tree
   - *Romance*: The Seven Husbands of Evelyn Hugo, Book Lovers, Normal People
2. **Non-Fiction** (11 items)
   - *Biographies*: Steve Jobs, Becoming
   - *Self-Help*: Atomic Habits, The Psychology of Money
   - *History*: Sapiens: A Brief History of Humankind, The Silk Roads
   - *Science*: Cosmos, Brief Answers to the Big Questions
   - *Business & Finance*: Thinking, Fast and Slow, Zero to One, Rich Dad Poor Dad
3. **Children's Books** (11 items)
   - *Picture Books*: The Very Hungry Caterpillar, Where the Wild Things Are
   - *Story Books*: The Little Prince, Charlie and the Chocolate Factory
   - *Educational Books*: My First Encyclopedia of Animals, Tell Me Why: The Big Book of Wonders
   - *Activity Books*: The Big Book of Mazes and Puzzles, Origami World
   - *Board Books*: Dear Zoo, Goodnight Moon, Brown Bear, Brown Bear, What Do You See?
4. **Stationery** (11 items)
   - *Notebooks & Journals*: Vintage Hardbound Leather Journal, Dot-Grid Bullet Journal
   - *Pens & Pencils*: Classic Solid Brass Fountain Pen, Japanese Fineliner Archival Ink Pens
   - *Art Supplies*: Pocket Watercolor Travel Studio (24 Half Pans), Dual-Tip Calligraphy Brush Pens
   - *Desk Accessories*: Handcrafted Oak Wood Book Stand, Brass Antique Celestial Bookmarks
   - *Gift Sets*: The Bibliophile's Luxury Reading Gift Box, Calligrapher's Collector Hamper & Wax Seal Kit, Junior Artist's Storybook & Crayon Hamper

---

## 6. Project Structure

```text
BookNook/
├── index.html            # Home page (Hero, Categories, Bestsellers, New Arrivals)
├── books.html            # Catalogue listing with sidebar filters & sorting
├── book.html             # Product detail view with specs & review form
├── cart.html             # Shopping cart with gift wrap & live totals
├── checkout.html         # Multi-step checkout with address validation
├── account.html          # User profile, 5-step order tracking & wishlist
├── login.html            # Sign In / Register forms with demo accounts
├── about.html            # Bookstore origin story, mission & team
├── contact.html          # Store address, contact form & styled map
├── author.html           # Author biography & bibliographic works
├── css/
│   ├── style.css         # Main stylesheet (Palette, Typography, Cards, Modals)
│   └── responsive.css    # Responsive grid breakpoints & mobile drawer
├── js/
│   ├── data.js           # 44 seed products, categories, authors, reviews & config
│   ├── app.js            # Storage engine, shared header/footer injection, search & toasts
│   ├── filters.js        # Dynamic filtering, sorting, active tags & URL params
│   ├── cart.js           # Cart calculation, quantities, gift wrap & shipping logic
│   ├── checkout.js       # Form validation, payment handlers & confirmation screen
│   └── account.js        # Order timeline modal, addresses & profile editor
├── images/
│   ├── covers/           # 44 custom SVG book covers
│   ├── authors/          # 12 custom SVG author portraits
│   └── banners/          # Hero banner artwork
└── README.md             # Complete project documentation
```

---

## 7. How to Run Locally

Because BookNook is built using clean, pure modern web standards (HTML5, CSS3, ES6 JavaScript) without external server or database dependencies:

1. **Option A (Direct in Browser)**:
   - Double-click `index.html` or drag and drop it into Google Chrome, Microsoft Edge, Mozilla Firefox, or Safari.

2. **Option B (Using any local static server)**:
   ```bash
   # Using Python 3
   python -m http.server 8000

   # Or using npx serve
   npx serve .
   ```
   Open `http://localhost:8000` in your web browser.

---

## 8. Demo User Credentials for Testing

To make evaluation seamless, two pre-configured demo user accounts are provided with saved addresses, orders, and wishlists:

| Persona | Email | Password | Role |
|---|---|---|---|
| **Ananya Sharma** | `ananya@booknook.in` | `password123` | Avid Reader (Bengaluru) |
| **Rahul Verma** | `rahul@example.com` | `password123` | Student (Delhi) |

You can also click the **"One-Click Demo Personas"** buttons on `login.html` to instantly sign in without typing!

---

## 9. Acceptance Criteria Verification

- [x] **Every one of the 9 core pages + 1 bonus author page exists** and is linked from navigation.
- [x] **All 4 main categories and 20 sub-categories** contain realistic products.
- [x] **Instant search** matches titles, authors, categories, or ISBNs with drop-down preview.
- [x] **Filters** narrow results correctly (category, subcategory, price, rating, language, author) and can be cleared.
- [x] **Cart operations** (add, increase, decrease, remove) update the badge count and totals immediately and survive page refreshes.
- [x] **Checkout validation** enforces mandatory fields and format rules (10-digit mobile, 6-digit Indian PIN code).
- [x] **Order confirmation screen** generates unique order ID (`BN-2026-XXXX`) and persists order in history.
- [x] **5-stage order tracking timeline** displays live status (`Placed` → `Packed` → `Shipped` → `Out for delivery` → `Delivered`).
- [x] **Simulated authentication** works with `localStorage`; protected pages (`account.html`) redirect guests to login.
- [x] **Colours match the PRD palette** (Forest Green `#2D6A4F`, Cream `#FDF6E3`, White `#FFFFFF`).
- [x] **Zero horizontal scrolling** from 320px to 1920px width.
- [x] **Zero console errors**.


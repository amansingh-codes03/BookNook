# Generate-Assets.ps1 - Generates all book covers, author avatars, and banner SVGs

$books = @(
  @{ id="midnight-library"; title="The Midnight"; subtitle="Library"; author="Matt Haig"; cat="Fiction"; bg="#1B3B36"; accent="#74C69D"; motif="library" },
  @{ id="where-the-crawdads-sing"; title="Where The"; subtitle="Crawdads Sing"; author="Delia Owens"; cat="Fiction"; bg="#234E42"; accent="#F2C94C"; motif="marsh" },
  @{ id="the-silent-patient"; title="The Silent"; subtitle="Patient"; author="Alex Michaelides"; cat="Fiction"; bg="#2B2D42"; accent="#EF233C"; motif="mask" },
  @{ id="thursday-murder-club"; title="The Thursday"; subtitle="Murder Club"; author="Richard Osman"; cat="Fiction"; bg="#3D405B"; accent="#E07A5F"; motif="clue" },
  @{ id="project-hail-mary"; title="Project"; subtitle="Hail Mary"; author="Andy Weir"; cat="Fiction"; bg="#0F172A"; accent="#38BDF8"; motif="rocket" },
  @{ id="dune"; title="Dune"; subtitle="Chronicles"; author="Frank Herbert"; cat="Fiction"; bg="#78350F"; accent="#FBBF24"; motif="desert" },
  @{ id="name-of-the-wind"; title="The Name Of"; subtitle="The Wind"; author="Patrick Rothfuss"; cat="Fiction"; bg="#1E3A8A"; accent="#93C5FD"; motif="lute" },
  @{ id="priory-orange-tree"; title="The Priory of"; subtitle="The Orange Tree"; author="Samantha Shannon"; cat="Fiction"; bg="#831843"; accent="#F472B6"; motif="dragon" },
  @{ id="evelyn-hugo"; title="The Seven Husbands"; subtitle="of Evelyn Hugo"; author="Taylor Jenkins Reid"; cat="Fiction"; bg="#064E3B"; accent="#34D399"; motif="gem" },
  @{ id="book-lovers"; title="Book Lovers"; subtitle="A Novel"; author="Emily Henry"; cat="Fiction"; bg="#881337"; accent="#FDA4AF"; motif="heart" },
  @{ id="normal-people"; title="Normal People"; subtitle="A Novel"; author="Sally Rooney"; cat="Fiction"; bg="#1E293B"; accent="#CBD5E1"; motif="people" },

  @{ id="steve-jobs"; title="Steve Jobs"; subtitle="Exclusive Biography"; author="Walter Isaacson"; cat="Non-Fiction"; bg="#18181B"; accent="#E4E4E7"; motif="tech" },
  @{ id="becoming"; title="Becoming"; subtitle="An Intimate Memoir"; author="Michelle Obama"; cat="Non-Fiction"; bg="#312E81"; accent="#C7D2FE"; motif="feather" },
  @{ id="atomic-habits"; title="Atomic Habits"; subtitle="Tiny Changes"; author="James Clear"; cat="Non-Fiction"; bg="#1E3A5F"; accent="#F59E0B"; motif="atom" },
  @{ id="psychology-of-money"; title="The Psychology"; subtitle="of Money"; author="Morgan Housel"; cat="Non-Fiction"; bg="#14532D"; accent="#86EFAC"; motif="coin" },
  @{ id="sapiens"; title="Sapiens"; subtitle="Brief History of Humankind"; author="Yuval Noah Harari"; cat="Non-Fiction"; bg="#451A03"; accent="#FCD34D"; motif="history" },
  @{ id="silk-roads"; title="The Silk Roads"; subtitle="A New History"; author="Peter Frankopan"; cat="Non-Fiction"; bg="#581C87"; accent="#D8B4FE"; motif="compass" },
  @{ id="cosmos"; title="Cosmos"; subtitle="Voyage of Wonder"; author="Carl Sagan"; cat="Non-Fiction"; bg="#030712"; accent="#60A5FA"; motif="cosmos" },
  @{ id="brief-answers"; title="Brief Answers"; subtitle="To The Big Questions"; author="Stephen Hawking"; cat="Non-Fiction"; bg="#172554"; accent="#93C5FD"; motif="blackhole" },
  @{ id="thinking-fast-slow"; title="Thinking,"; subtitle="Fast and Slow"; author="Daniel Kahneman"; cat="Non-Fiction"; bg="#334155"; accent="#94A3B8"; motif="brain" },
  @{ id="zero-to-one"; title="Zero to One"; subtitle="Notes on Startups"; author="Peter Thiel"; cat="Non-Fiction"; bg="#1E1B4B"; accent="#A78BFA"; motif="rocket" },
  @{ id="rich-dad-poor-dad"; title="Rich Dad"; subtitle="Poor Dad"; author="Robert T. Kiyosaki"; cat="Non-Fiction"; bg="#701A75"; accent="#F0ABFC"; motif="cash" },

  @{ id="hungry-caterpillar"; title="The Very Hungry"; subtitle="Caterpillar"; author="Eric Carle"; cat="Children"; bg="#15803D"; accent="#FACC15"; motif="leaf" },
  @{ id="wild-things"; title="Where The"; subtitle="Wild Things Are"; author="Maurice Sendak"; cat="Children"; bg="#065F46"; accent="#FEF08A"; motif="crown" },
  @{ id="little-prince"; title="The Little"; subtitle="Prince"; author="Antoine de Saint-Exupery"; cat="Children"; bg="#1E3A8A"; accent="#FDE047"; motif="rose" },
  @{ id="charlie-chocolate"; title="Charlie and The"; subtitle="Chocolate Factory"; author="Roald Dahl"; cat="Children"; bg="#451A03"; accent="#FBBF24"; motif="ticket" },
  @{ id="natgeo-animals"; title="My First"; subtitle="Encyclopedia Animals"; author="NatGeo Kids"; cat="Children"; bg="#0F766E"; accent="#5EEAD4"; motif="lion" },
  @{ id="tell-me-why"; title="Tell Me Why"; subtitle="Big Book of Wonders"; author="Arkady Leokum"; cat="Children"; bg="#0369A1"; accent="#7DD3FC"; motif="bulb" },
  @{ id="mazes-puzzles"; title="The Big Book of"; subtitle="Mazes & Puzzles"; author="Wonder House"; cat="Children"; bg="#BE185D"; accent="#FBCFE8"; motif="puzzle" },
  @{ id="origami-world"; title="Origami World"; subtitle="Paper Folding"; author="Tuttle Studio"; cat="Children"; bg="#C2410C"; accent="#FED7AA"; motif="origami" },
  @{ id="dear-zoo"; title="Dear Zoo"; subtitle="Lift the Flap Book"; author="Rod Campbell"; cat="Children"; bg="#B45309"; accent="#FDE68A"; motif="crate" },
  @{ id="goodnight-moon"; title="Goodnight"; subtitle="Moon"; author="Margaret Wise Brown"; cat="Children"; bg="#166534"; accent="#BBF7D0"; motif="moon" },
  @{ id="brown-bear"; title="Brown Bear,"; subtitle="Brown Bear"; author="Bill Martin Jr."; cat="Children"; bg="#78350F"; accent="#FDE047"; motif="bear" },

  @{ id="leather-journal"; title="Vintage Hardbound"; subtitle="Leather Journal 240p"; author="BookNook Atelier"; cat="Stationery"; bg="#3F2E23"; accent="#D4AF37"; motif="quill" },
  @{ id="dotgrid-journal"; title="Dot-Grid Journal"; subtitle="120gsm Sage Linen"; author="BookNook Atelier"; cat="Stationery"; bg="#2D6A4F"; accent="#D8F3DC"; motif="dots" },
  @{ id="brass-pen"; title="Classic Solid Brass"; subtitle="Fountain Pen"; author="BookNook Atelier"; cat="Stationery"; bg="#4A3B2C"; accent="#FCD34D"; motif="pen" },
  @{ id="fineliner-pens"; title="Archival Ink"; subtitle="Fineliner Set (6)"; author="BookNook Atelier"; cat="Stationery"; bg="#1F2937"; accent="#E5E7EB"; motif="nibs" },
  @{ id="watercolor-studio"; title="Pocket Watercolor"; subtitle="Studio 24 Pans"; author="BookNook Atelier"; cat="Stationery"; bg="#1E40AF"; accent="#93C5FD"; motif="palette" },
  @{ id="brush-pens"; title="Dual-Tip Calligraphy"; subtitle="Brush Pens (12)"; author="BookNook Atelier"; cat="Stationery"; bg="#831843"; accent="#F472B6"; motif="brush" },
  @{ id="wooden-bookstand"; title="Handcrafted Oak"; subtitle="Wood Book Stand"; author="BookNook Atelier"; cat="Stationery"; bg="#573824"; accent="#FDE68A"; motif="stand" },
  @{ id="celestial-bookmarks"; title="Celestial Brass"; subtitle="Bookmarks (Set of 4)"; author="BookNook Atelier"; cat="Stationery"; bg="#1E1B4B"; accent="#FBBF24"; motif="stars" },
  @{ id="bibliophile-gift-box"; title="The Bibliophile's"; subtitle="Luxury Gift Box"; author="BookNook Atelier"; cat="Stationery"; bg="#1C3D2E"; accent="#E9D5A1"; motif="gift" },
  @{ id="wax-seal-kit"; title="Calligrapher's Kit"; subtitle="& Wax Seal Hamper"; author="BookNook Atelier"; cat="Stationery"; bg="#4C0519"; accent="#FECDD3"; motif="seal" },
  @{ id="junior-artist-hamper"; title="Junior Storybook"; subtitle="& Crayon Hamper"; author="BookNook Atelier"; cat="Stationery"; bg="#065F46"; accent="#A7F3D0"; motif="crayon" }
)

foreach ($b in $books) {
  $file = "images/covers/$($b.id).svg"
  $svg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 600" width="400" height="600">
  <defs>
    <linearGradient id="bgGrad-$($b.id)" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="$($b.bg)" />
      <stop offset="100%" stop-color="#111827" stop-opacity="0.9" />
    </linearGradient>
    <linearGradient id="spineGrad" x1="0%" y1="0%" x2="100%" y2="0%">
      <stop offset="0%" stop-color="#FFFFFF" stop-opacity="0.25" />
      <stop offset="3%" stop-color="#FFFFFF" stop-opacity="0.05" />
      <stop offset="8%" stop-color="#000000" stop-opacity="0.3" />
      <stop offset="100%" stop-color="#000000" stop-opacity="0" />
    </linearGradient>
  </defs>

  <!-- Book Base -->
  <rect width="400" height="600" rx="12" fill="url(#bgGrad-$($b.id))" />
  
  <!-- Subtle Vintage Texture / Frame -->
  <rect x="18" y="18" width="364" height="564" rx="8" fill="none" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="2" />
  <rect x="24" y="24" width="352" height="552" rx="6" fill="none" stroke="$($b.accent)" stroke-opacity="0.2" stroke-width="1" />

  <!-- Corner Flourishes -->
  <path d="M 28 44 L 44 28 M 28 48 L 48 28" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="1" />
  <path d="M 372 44 L 356 28 M 372 48 L 352 28" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="1" />
  <path d="M 28 556 L 44 572 M 28 552 L 48 572" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="1" />
  <path d="M 372 556 L 356 572 M 372 552 L 352 572" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="1" />

  <!-- Category Tag -->
  <g transform="translate(200, 75)" text-anchor="middle">
    <rect x="-65" y="-14" width="130" height="26" rx="13" fill="$($b.accent)" fill-opacity="0.15" stroke="$($b.accent)" stroke-opacity="0.4" stroke-width="1" />
    <text y="4" font-family="'Plus Jakarta Sans', system-ui, sans-serif" font-size="11" font-weight="700" letter-spacing="1.5" fill="$($b.accent)">$($b.cat.ToUpper())</text>
  </g>

  <!-- Central Motif Emblem -->
  <g transform="translate(200, 190)" text-anchor="middle">
    <circle r="46" fill="none" stroke="$($b.accent)" stroke-opacity="0.3" stroke-width="1.5" stroke-dasharray="3 3" />
    <circle r="38" fill="$($b.accent)" fill-opacity="0.12" />
    <circle r="32" fill="none" stroke="$($b.accent)" stroke-opacity="0.5" stroke-width="1" />
    <text y="10" font-family="'Playfair Display', Georgia, serif" font-size="30" fill="$($b.accent)">✦</text>
  </g>

  <!-- Title & Subtitle -->
  <text x="200" y="300" text-anchor="middle" font-family="'Playfair Display', Georgia, serif" font-weight="700" font-size="28" fill="#FFFFFF" letter-spacing="0.5">
    $($b.title)
  </text>
  <text x="200" y="336" text-anchor="middle" font-family="'Playfair Display', Georgia, serif" font-style="italic" font-size="20" fill="$($b.accent)">
    $($b.subtitle)
  </text>

  <!-- Decorative Separator -->
  <g transform="translate(200, 385)">
    <line x1="-60" y1="0" x2="-15" y2="0" stroke="$($b.accent)" stroke-opacity="0.5" stroke-width="1.5" />
    <circle cx="0" cy="0" r="3" fill="$($b.accent)" />
    <line x1="15" y1="0" x2="60" y2="0" stroke="$($b.accent)" stroke-opacity="0.5" stroke-width="1.5" />
  </g>

  <!-- Author Name -->
  <text x="200" y="440" text-anchor="middle" font-family="'Plus Jakarta Sans', system-ui, sans-serif" font-weight="600" font-size="14" letter-spacing="2" fill="#E2E8F0">
    $($b.author.ToUpper())
  </text>

  <!-- BookNook Hallmark Seal -->
  <g transform="translate(200, 525)" text-anchor="middle">
    <rect x="-55" y="-12" width="110" height="22" rx="4" fill="#000000" fill-opacity="0.3" />
    <text y="3" font-family="'Plus Jakarta Sans', system-ui, sans-serif" font-weight="600" font-size="10" letter-spacing="1.5" fill="$($b.accent)">BOOKNOOK EDITIONS</text>
  </g>

  <!-- Book Spine 3D Lighting -->
  <rect x="0" y="0" width="30" height="600" rx="12" fill="url(#spineGrad)" />
</svg>
"@
  Set-Content -Path $file -Value $svg -Encoding UTF8
}

# Authors Avatars
$authors = @(
  @{ id="matt-haig"; initials="MH"; name="Matt Haig"; color="#2D6A4F" },
  @{ id="delia-owens"; initials="DO"; name="Delia Owens"; color="#1B4332" },
  @{ id="alex-michaelides"; initials="AM"; name="Alex Michaelides"; color="#2B2D42" },
  @{ id="richard-osman"; initials="RO"; name="Richard Osman"; color="#4A5568" },
  @{ id="andy-weir"; initials="AW"; name="Andy Weir"; color="#1E3A8A" },
  @{ id="frank-herbert"; initials="FH"; name="Frank Herbert"; color="#78350F" },
  @{ id="james-clear"; initials="JC"; name="James Clear"; color="#0F766E" },
  @{ id="yuval-harari"; initials="YH"; name="Yuval Harari"; color="#701A75" },
  @{ id="morgan-housel"; initials="MH"; name="Morgan Housel"; color="#166534" },
  @{ id="antoine-exupery"; initials="AE"; name="Antoine de Saint-Exupéry"; color="#1E40AF" },
  @{ id="roald-dahl"; initials="RD"; name="Roald Dahl"; color="#9A3412" },
  @{ id="booknook-atelier"; initials="BN"; name="BookNook Atelier"; color="#2D6A4F" }
)

foreach ($a in $authors) {
  $aFile = "images/authors/$($a.id).svg"
  $aSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 200" width="200" height="200">
  <defs>
    <radialGradient id="authorGrad-$($a.id)" cx="50%" cy="30%" r="70%">
      <stop offset="0%" stop-color="$($a.color)" />
      <stop offset="100%" stop-color="#0F172A" />
    </radialGradient>
  </defs>
  <circle cx="100" cy="100" r="96" fill="url(#authorGrad-$($a.id))" stroke="#FDF6E3" stroke-width="4" />
  <circle cx="100" cy="100" r="88" fill="none" stroke="#D8F3DC" stroke-width="1.5" stroke-dasharray="4 4" opacity="0.6" />
  
  <!-- Silhouette / Monogram -->
  <circle cx="100" cy="78" r="32" fill="#FDF6E3" opacity="0.9" />
  <path d="M 45 160 C 50 120, 150 120, 155 160 Z" fill="#FDF6E3" opacity="0.9" />
  
  <text x="100" y="88" text-anchor="middle" font-family="'Playfair Display', Georgia, serif" font-weight="700" font-size="24" fill="$($a.color)">
    $($a.initials)
  </text>
</svg>
"@
  Set-Content -Path $aFile -Value $aSvg -Encoding UTF8
}

# Hero Banner Graphic
$bannerSvg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 600" width="800" height="600">
  <defs>
    <linearGradient id="warmLight" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#FDF6E3" />
      <stop offset="50%" stop-color="#F4EBD9" />
      <stop offset="100%" stop-color="#E8DCBE" />
    </linearGradient>
  </defs>
  <rect width="800" height="600" rx="20" fill="url(#warmLight)" />
  
  <!-- Bookshelf graphic -->
  <rect x="60" y="480" width="680" height="24" rx="4" fill="#8D5B4C" />
  
  <!-- Books stacked -->
  <rect x="100" y="240" width="55" height="240" rx="4" fill="#2D6A4F" />
  <rect x="110" y="250" width="35" height="220" rx="2" fill="none" stroke="#D8F3DC" stroke-width="1" />
  
  <rect x="160" y="210" width="65" height="270" rx="4" fill="#881337" />
  <rect x="175" y="225" width="35" height="240" rx="2" fill="none" stroke="#FDE68A" stroke-width="1" />
  
  <rect x="230" y="260" width="50" height="220" rx="4" fill="#1E3A8A" />
  
  <!-- Slanted book -->
  <g transform="translate(290, 260) rotate(14)">
    <rect x="0" y="0" width="55" height="220" rx="4" fill="#D97706" />
    <line x1="8" y1="10" x2="8" y2="210" stroke="#FDF6E3" stroke-width="2" />
  </g>

  <!-- Cozy coffee mug & plant -->
  <rect x="420" y="380" width="60" height="100" rx="10" fill="#40916C" />
  <circle cx="450" cy="340" r="28" fill="#52B788" />
  <circle cx="430" cy="320" r="22" fill="#74C69D" />
  <circle cx="470" cy="320" r="22" fill="#2D6A4F" />

  <!-- Cozy Reading Chair -->
  <path d="M 540 480 L 540 380 Q 540 300 620 300 Q 700 300 700 380 L 700 480 Z" fill="#2D6A4F" opacity="0.9" />
  <ellipse cx="620" cy="390" rx="70" ry="25" fill="#1B4332" />
  <rect x="530" y="470" width="180" height="15" rx="6" fill="#1B4332" />
  <line x1="560" y1="485" x2="550" y2="520" stroke="#8D5B4C" stroke-width="8" stroke-linecap="round" />
  <line x1="680" y1="485" x2="690" y2="520" stroke="#8D5B4C" stroke-width="8" stroke-linecap="round" />

  <!-- Steam curls -->
  <path d="M 430 330 Q 440 300 430 270 Q 420 240 435 210" fill="none" stroke="#D4A373" stroke-width="3" opacity="0.5" stroke-linecap="round" />

  <!-- Warm ambient lamp -->
  <line x1="620" y1="80" x2="620" y2="200" stroke="#D4A373" stroke-width="4" />
  <path d="M 570 240 L 670 240 L 640 190 L 600 190 Z" fill="#D4A373" />
  <circle cx="620" cy="245" r="16" fill="#FDE047" opacity="0.9" />
  <circle cx="620" cy="260" r="90" fill="#FEF08A" opacity="0.18" />

  <text x="400" y="140" text-anchor="middle" font-family="'Playfair Display', Georgia, serif" font-weight="700" font-size="34" fill="#1B4332">A Cozy Corner for Every Reader</text>
  <text x="400" y="175" text-anchor="middle" font-family="'Plus Jakarta Sans', system-ui, sans-serif" font-size="16" fill="#4B5563">Curated Books, Fine Stationery &amp; Warm Community</text>
</svg>
"@
Set-Content -Path "images/banners/hero-books.svg" -Value $bannerSvg -Encoding UTF8

Write-Host "All assets generated successfully!"


# 🌐 Simplified AWS VPC Architecture

<img src=cover.png>

## 🏠 Main House (Your VPC: `10.0.0.0/16`)

You build a big house with space for many rooms (subnets).

### 🛏️ Room 1 — Servers Room (Private Subnet)

- Room Address: `10.0.1.0/24`
- A VM lives here: 🖥️ `10.0.1.162`

### 🧪 Room 2 — Testing Room (Private Subnet)

- Room Address: `10.0.2.0/24`
- A test server lives here: 🖥️ `10.0.2.45`

Nobody from the outside can enter your house directly.

---

## 🚪 Secure Door (VPN in a Separate House)

You install a secure door (VPN gateway), but it's **in another nearby house**, not your main house.

---

## 🏘️ Second House (VPN + Staging VPC: `10.10.0.0/16`)

This house is only for:

- VPN users
- Maybe staging stuff

When someone connects to VPN, they get an address like:

- 👩‍💻 VPN user: `10.10.0.5`

---

## 🛣️ The Hallway (VPC Peering)

You connect your two houses with a hallway (VPC peering):

- So VPN users in `10.10.x.x` can visit rooms in `10.0.x.x`
- You also let your house visit staging systems (if needed)

---

## 🔄 Final Result

| Who            | Where        | What they can access                                          |
| -------------- | ------------ | ------------------------------------------------------------- |
| 👩‍💻 VPN User    | `10.10.0.5`  | Walks through hallway → enters Room 1 → Talks to `10.0.1.162` |
| 🧪 Test Server | `10.0.2.45`  | Can talk to other rooms in the same house                     |
| 🖥️ Main Server | `10.0.1.162` | Can be accessed by VPN users via hallway                      |

---

## 🛫 Internet Gateway = The Main Front Gate to the Street (Internet)

### This is the main public door of your house.

- If you attach this to a room (subnet) and open it in the route table, then:

- Anything in that room can go out to the internet.

- For example: download updates, connect to public APIs.

- 🔓 Only rooms connected to this front gate can see the internet.

---

## 🛬 NAT Gateway = One-Way Door

### This is like a one-way mirror door to the internet.

- It's used for private rooms (subnets) that:

- Can go out to the internet, but

- No one can come in from outside.

### 🛠 Example:

- Room 1: 10.0.1.0/24 has no public IP, but route table sends traffic to NAT gateway → can install updates from internet.

- But no one from internet can knock on that door and get in.

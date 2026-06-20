# Pharmacy API

REST API for the Pharmacy service (Go + Gin + PostgreSQL).

- **Base URL:** `http://localhost:8080/api`
- **Content type:** `application/json`
- **Auth:** send the token from `POST /auth/login` as `Authorization: Bearer <token>`.

**Response envelope**

```json
// success
{ "success": true, "data": { ... }, "meta": { "total": 0, "limit": 20, "offset": 0 } }

// error
{ "success": false, "error_msg": "Fill the required key", "error_code": "required" }
```

`meta` appears only on list endpoints. Error codes: `required`, `invalid`,
`not_found`, `conflict`, `unauthorized`, `forbidden`, `internal`.

**Roles:** `admin`, `pharmacy`, `user`.

---

## Endpoints

### Auth
| Method | URL |
|--------|-----|
| POST   | `/auth/login` |
| POST   | `/auth/register` |
| POST   | `/auth/logout` |

### Profile
| Method | URL |
|--------|-----|
| GET    | `/me` |
| PUT    | `/me` |

### Catalog (public)
| Method | URL |
|--------|-----|
| GET    | `/catalog/medicines` |
| GET    | `/catalog/medicines/:id` |
| GET    | `/catalog/categories` |
| GET    | `/catalog/categories/:id` |
| GET    | `/catalog/pharmacies` |
| GET    | `/catalog/pharmacies/:id` |

### Checkout & Orders (user)
| Method | URL |
|--------|-----|
| POST   | `/me/checkout` |
| GET    | `/me/orders` |
| GET    | `/me/orders/:id` |

### Admin — Users
| Method | URL |
|--------|-----|
| GET    | `/admin/users` |
| POST   | `/admin/users` |
| GET    | `/admin/users/:id` |
| PUT    | `/admin/users/:id` |
| DELETE | `/admin/users/:id` |

### Admin — Medicines
| Method | URL |
|--------|-----|
| GET    | `/admin/medicines` |
| POST   | `/admin/medicines` |
| GET    | `/admin/medicines/:id` |
| PUT    | `/admin/medicines/:id` |
| DELETE | `/admin/medicines/:id` |

### Admin — Categories
| Method | URL |
|--------|-----|
| GET    | `/admin/categories` |
| POST   | `/admin/categories` |
| GET    | `/admin/categories/:id` |
| PUT    | `/admin/categories/:id` |
| DELETE | `/admin/categories/:id` |

### Admin — Pharmacies
| Method | URL |
|--------|-----|
| GET    | `/admin/pharmacies` |
| POST   | `/admin/pharmacies` |
| GET    | `/admin/pharmacies/:id` |
| PUT    | `/admin/pharmacies/:id` |
| DELETE | `/admin/pharmacies/:id` |

### Admin — Orders
| Method | URL |
|--------|-----|
| GET    | `/admin/orders` |
| GET    | `/admin/orders/:id` |
| PATCH  | `/admin/orders/:id/status` |

---

## Details

### Auth

#### POST `/auth/login`
Request:
```json
{ "email": "jane@example.com", "password": "secret" }
```
Response:
```json
{ "success": true, "data": {
  "token": "9f2c1ab34de5...",
  "expires_at": "2026-06-14T10:00:00Z",
  "user": { "id": 123, "name": "Jane", "email": "jane@example.com", "role": "user" }
} }
```

#### POST `/auth/register`
Request:
```json
{ "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "password": "secret" }
```
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "role": "user" } }
```

#### POST `/auth/logout`
Request: _(none — uses Authorization header)_
Response:
```json
{ "success": true, "data": null }
```

---

### Profile

#### GET `/me`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "role": "user" } }
```

#### PUT `/me`
Request:
```json
{ "name": "Jane D.", "phone": "+99361234567", "region": "Mary" }
```
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane D.", "phone": "+99361234567", "region": "Mary", "email": "jane@example.com", "role": "user" } }
```

---

### Catalog (public — no auth)

#### GET `/catalog/medicines`
Request (query): `search`, `category_id`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [
  { "id": 1, "name": "Paracetamol", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 40, "category_id": 3, "pharmacy_id": 1 }
], "meta": { "total": 120, "limit": 20, "offset": 0 } }
```

#### GET `/catalog/medicines/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Paracetamol", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 40, "category_id": 3, "pharmacy_id": 1 } }
```

#### GET `/catalog/categories`
Request (query): `search`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [ { "id": 1, "name": "Pain Relief" } ], "meta": { "total": 4, "limit": 20, "offset": 0 } }
```

#### GET `/catalog/categories/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Pain Relief" } }
```

#### GET `/catalog/pharmacies`
Request (query): `search`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [ { "id": 1, "name": "Central Pharmacy", "address": "Moskowsky 12", "pharmacy_hours": "24/7" } ], "meta": { "total": 2, "limit": 20, "offset": 0 } }
```

#### GET `/catalog/pharmacies/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Central Pharmacy", "address": "Moskowsky 12", "pharmacy_hours": "24/7" } }
```

---

### Checkout & Orders (user)

#### POST `/me/checkout`
Request:
```json
{
  "cart": [ { "medicine_id": 123, "quantity": 1 }, { "medicine_id": 88, "quantity": 2 } ],
  "address": "Moskowsky 12",
  "notes": "tizrak getiräý"
}
```
Response:
```json
{ "success": true, "data": {
  "id": 1, "user_id": 123, "status": "pending",
  "items": [ { "medicine_id": 123, "name": "Paracetamol", "quantity": 1, "price": 9.99 } ],
  "total": 9.99, "address": "Moskowsky 12", "notes": "tizrak getiräý"
} }
```
Errors: `400 required` (empty cart / no address), `404 not_found` (bad medicine_id), `409 conflict` (out of stock).

#### GET `/me/orders`
Request (query): `status`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [
  { "id": 1, "status": "pending", "total": 9.99, "address": "Moskowsky 12", "items": [ ... ] }
], "meta": { "total": 3, "limit": 20, "offset": 0 } }
```

#### GET `/me/orders/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": {
  "id": 1, "user_id": 123, "status": "pending",
  "items": [ { "medicine_id": 123, "name": "Paracetamol", "quantity": 1, "price": 9.99 } ],
  "total": 9.99, "address": "Moskowsky 12", "notes": "tizrak getiräý"
} }
```

---

### Admin — Users (admin)

#### GET `/admin/users`
Request (query): `search`, `role`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [
  { "id": 123, "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "role": "user" }
], "meta": { "total": 58, "limit": 20, "offset": 0 } }
```

#### POST `/admin/users`
Request:
```json
{ "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "password": "secret", "role": "user" }
```
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "role": "user" } }
```

#### GET `/admin/users/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane", "phone": "+99361234567", "region": "Ashgabat", "email": "jane@example.com", "role": "user" } }
```

#### PUT `/admin/users/:id`
Request:
```json
{ "name": "Jane D.", "phone": "+99361234567", "region": "Mary", "role": "pharmacy" }
```
Response:
```json
{ "success": true, "data": { "id": 123, "name": "Jane D.", "phone": "+99361234567", "region": "Mary", "email": "jane@example.com", "role": "pharmacy" } }
```

#### DELETE `/admin/users/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": null }
```

---

### Admin — Medicines (pharmacy / admin)

#### GET `/admin/medicines`
Request (query): `search`, `category_id`, `pharmacy_id`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [
  { "id": 1, "name": "Paracetamol 500mg", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 120, "category_id": 1, "pharmacy_id": 1 }
], "meta": { "total": 120, "limit": 20, "offset": 0 } }
```

#### POST `/admin/medicines`
Request:
```json
{ "name": "Paracetamol 500mg", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 120, "category_id": 1, "pharmacy_id": 1 }
```
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Paracetamol 500mg", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 120, "category_id": 1, "pharmacy_id": 1 } }
```

#### GET `/admin/medicines/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Paracetamol 500mg", "description": "Pain reliever", "price": 12.5, "new_price": 9.99, "stock": 120, "category_id": 1, "pharmacy_id": 1 } }
```

#### PUT `/admin/medicines/:id`
Request:
```json
{ "name": "Paracetamol 500mg", "price": 13.0, "new_price": 10.5, "stock": 100, "category_id": 1, "pharmacy_id": 1 }
```
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Paracetamol 500mg", "price": 13.0, "new_price": 10.5, "stock": 100, "category_id": 1, "pharmacy_id": 1 } }
```

#### DELETE `/admin/medicines/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": null }
```

---

### Admin — Categories (pharmacy / admin)

#### GET `/admin/categories`
Request (query): `search`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [ { "id": 1, "name": "Pain Relief" } ], "meta": { "total": 4, "limit": 20, "offset": 0 } }
```

#### POST `/admin/categories`
Request:
```json
{ "name": "Antibiotics" }
```
Response:
```json
{ "success": true, "data": { "id": 2, "name": "Antibiotics" } }
```

#### GET `/admin/categories/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Pain Relief" } }
```

#### PUT `/admin/categories/:id`
Request:
```json
{ "name": "Pain & Fever" }
```
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Pain & Fever" } }
```

#### DELETE `/admin/categories/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": null }
```

---

### Admin — Pharmacies (admin)

#### GET `/admin/pharmacies`
Request (query): `search`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [ { "id": 1, "name": "Central Pharmacy", "address": "Moskowsky 12", "pharmacy_hours": "24/7" } ], "meta": { "total": 2, "limit": 20, "offset": 0 } }
```

#### POST `/admin/pharmacies`
Request:
```json
{ "name": "Berkarar Apteka", "address": "Bitarap Türkmenistan 45", "pharmacy_hours": "08:00–22:00" }
```
Response:
```json
{ "success": true, "data": { "id": 2, "name": "Berkarar Apteka", "address": "Bitarap Türkmenistan 45", "pharmacy_hours": "08:00–22:00" } }
```

#### GET `/admin/pharmacies/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Central Pharmacy", "address": "Moskowsky 12", "pharmacy_hours": "24/7" } }
```

#### PUT `/admin/pharmacies/:id`
Request:
```json
{ "name": "Central Pharmacy", "address": "Moskowsky 14", "pharmacy_hours": "24/7" }
```
Response:
```json
{ "success": true, "data": { "id": 1, "name": "Central Pharmacy", "address": "Moskowsky 14", "pharmacy_hours": "24/7" } }
```

#### DELETE `/admin/pharmacies/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": null }
```

---

### Admin — Orders (pharmacy / admin)

#### GET `/admin/orders`
Request (query): `status`, `user_id`, `limit`, `offset`
Response:
```json
{ "success": true, "data": [
  { "id": 1, "user_id": 3, "status": "pending",
    "items": [ { "medicine_id": 123, "name": "Paracetamol 500mg", "quantity": 2, "price": 9.99 } ],
    "total": 19.98, "address": "Moskowsky 12", "notes": "tizrak getiräý" }
], "meta": { "total": 58, "limit": 20, "offset": 0 } }
```

#### GET `/admin/orders/:id`
Request: _(none)_
Response:
```json
{ "success": true, "data": {
  "id": 1, "user_id": 3, "status": "pending",
  "items": [ { "medicine_id": 123, "name": "Paracetamol 500mg", "quantity": 2, "price": 9.99 } ],
  "total": 19.98, "address": "Moskowsky 12", "notes": "tizrak getiräý"
} }
```

#### PATCH `/admin/orders/:id/status`
Allowed: `pending → paid → shipped → delivered`, or `pending|paid → cancelled`.
Request:
```json
{ "status": "shipped" }
```
Response:
```json
{ "success": true, "data": { "id": 1, "status": "shipped", "total": 19.98, "address": "Moskowsky 12", "items": [ ... ] } }
```
Errors: `400 invalid` (illegal transition), `404 not_found`.

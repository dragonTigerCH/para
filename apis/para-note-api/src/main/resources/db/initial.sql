INSERT INTO para.users (identifier, password, name, social_provider, authorities, created_at, created_by, updated_at, updated_by)
VALUES
    -- Admin account (password: password123)
    ('admin@paranote.com', '$2a$10$cKhemNqFEna5iyJWPOjMHuI2TlgxUJTjfQy2Otlqh4BJuJaS0EJf6', 'Admin User', NULL, 'ROLE_ADMIN', NOW(), 1, NOW(), 1),

    -- Regular user accounts (password: password123)
    ('john@example.com', '$2a$10$cKhemNqFEna5iyJWPOjMHuI2TlgxUJTjfQy2Otlqh4BJuJaS0EJf6', 'John Doe', NULL, 'ROLE_USER', NOW(), 1, NOW(), 1),
    ('jane@example.com', '$2a$10$cKhemNqFEna5iyJWPOjMHuI2TlgxUJTjfQy2Otlqh4BJuJaS0EJf6', 'Jane Smith', NULL, 'ROLE_USER', NOW(), 1, NOW(), 1),
    ('bob@example.com', '$2a$10$cKhemNqFEna5iyJWPOjMHuI2TlgxUJTjfQy2Otlqh4BJuJaS0EJf6', 'Bob Johnson', NULL, 'ROLE_USER', NOW(), 1, NOW(), 1),
    ('alice@example.com', '$2a$10$cKhemNqFEna5iyJWPOjMHuI2TlgxUJTjfQy2Otlqh4BJuJaS0EJf6', 'Alice Williams', NULL, 'ROLE_USER', NOW(), 1, NOW(), 1);


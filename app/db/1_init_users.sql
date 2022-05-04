-- Create user for app to connect with
\connect tanuki
CREATE USER tanuki PASSWORD 'tanuki'; -- this password should be secret in the release
GRANT USAGE ON SCHEMA tanuki TO tanuki;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA tanuki to tanuki;
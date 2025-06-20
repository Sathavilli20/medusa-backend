const { Modules } = require("@medusajs/modules-sdk");

console.log("Modules:", Modules);  

module.exports = {
  projectConfig: {
    redis_url: process.env.REDIS_URL="redis://localhost:6379",
    database_url: process.env.DATABASE_URL="postgres://postgres:Nani%231975@localhost:5432/medusa_db",
    jwt_secret: process.env.JWT_SECRET || "1324a24ce2df466ba9b83d6d0c4b2b95a0872c6ba4434b7e986c360824bc143f",
    cookie_secret: process.env.COOKIE_SECRET="88d4b3a2-f90a-4e3a-a602-92cf07b7c5407094a2d6-0ae1-46f2-8810-8fce25210366",
  },

  modules: {
    [Modules.PAYMENT]: {
      resolve: "@medusajs/payment-stripe",
      options: {
        api_key: process.env.STRIPE_API_KEY,
        webhook_secret: process.env.STRIPE_WEBHOOK_SECRET,
      },
    },
  },
};

export default defineNuxtConfig({
    modules: ['@nuxtjs/tailwindcss'],
    runtimeConfig: {
        public: {
            HOST_NAME: process.env.HOSTNAME || "localhost",
            NODE_VERSION: process.env.NODE_VERSION,
        }
    }
})

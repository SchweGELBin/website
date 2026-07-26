import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
    site: "https://michi.im",
    trailingSlash: "always",
    vite : { plugins: [ tailwindcss() ] }
});

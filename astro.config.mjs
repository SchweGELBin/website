import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
    site: "https://www.michi.my",
    trailingSlash: "always",
    vite : { plugins: [ tailwindcss() ] }
});

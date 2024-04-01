/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "../Views/**/*.{cs,html,js,cshtml}",
        "../wwwroot/js/**/*.{cs,html,js,cshtml}",
        "../wwwroot/lib/datatables/**/*.{cs,html,js,cshtml}",
    ],
    theme: {
        extend: {},
    },
    plugins: [require("daisyui")],
}


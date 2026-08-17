# Tiers & Totals

A fillable invoice for a cake business. One self-contained HTML file — no build step,
no dependencies, no internet connection required.

Type straight into any field. The totals work themselves out: quantity × unit price
per line, plus delivery and tax, minus the deposit, leaving the balance due.

## Running it

Double-click **`start.command`**. It serves the folder and opens the invoice in your
browser, printing an address like `http://your-mac.local:8420` that also works from a
phone or tablet on the same wifi. Close the Terminal window to stop it.

You can also just open `index.html` directly in a browser — the server only exists so
other devices on the network can reach it.

### Why the `.local` address rather than an IP

Saved settings (see below) belong to the exact address they were entered on. The
Bonjour `.local` name survives the router handing out a different IP, so those
settings don't disappear. Use one address everywhere — `localhost` and
`192.168.x.x` count as different sites to the browser, each with its own storage.

## What it holds

Alongside the usual description/quantity/price lines, the invoice records the things
a cake order actually turns on: occasion, tiers and size, servings, flavour, filling
and frosting, event date, ready-by time, delivery or pickup, venue, and a free-text
design-notes box for colours, finish, inscription and allergy warnings.

## Settings that stick

**Save my business details** stores the bakery name, tagline, contact line,
thank-you note, terms and currency symbol in the browser's local storage, so they
only need entering once. Customer and order details are deliberately *not* stored —
each invoice starts clean.

Invoice numbers increment automatically (`2608-001`). The counter is only spent when
an invoice is printed or cleared, so opening the file to look at it doesn't burn a
number.

## Printing

**Print / Save as PDF** forces the light palette regardless of the screen theme and
lays the invoice out for one page. Turning off "Headers and footers" in the print
dialog gives a cleaner result.

## Editing

Everything lives in `index.html` — markup, styles and script in one file. Colours and
fonts are CSS custom properties at the top of the `<style>` block; changing them there
changes them everywhere, in both light and dark themes.

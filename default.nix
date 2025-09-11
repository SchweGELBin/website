{
  lib,
  nodejs,
  pnpm,
  stdenv,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "website";
  version = "1.4.1";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];

  pnpmDeps = pnpm.fetchDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-RV0XAQHvYNVbRvjoMOYOwNqlK5nfPsojOEPMj68YDq4=";
    fetcherVersion = 2;
  };

  buildPhase = "pnpm build";

  installPhase = ''
    mkdir -p $out
    cp -r dist/* $out
  '';

  meta = {
    description = "My website";
    homepage = "https://github.com/SchweGELBin/website";
    changelog = "https://github.com/SchweGELBin/website/blob/v${finalAttrs.version}/docs/CHANGELOG.md";
    license = lib.licenses.mit;
    mainProgram = finalAttrs.pname;
    maintainers = with lib.maintainers; [ SchweGELBin ];
  };
})

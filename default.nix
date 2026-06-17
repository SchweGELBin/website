{
  lib,
  stdenvNoCC,
  fetchPnpmDeps,
  nodejs,
  pnpm,
  pnpmConfigHook,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "website";
  version = "1.6.12";

  src = ./.;

  nativeBuildInputs = [
    nodejs
    pnpm
    pnpmConfigHook
  ];

  pnpmDeps = fetchPnpmDeps {
    inherit (finalAttrs) pname version src;
    hash = "sha256-WFTawOVdVDWZDL3ipjKrUOVNGnJzt48OP9U7UGLxtMA=";
    fetcherVersion = 4;
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
    maintainers = [ lib.maintainers.SchweGELBin ];
  };
})

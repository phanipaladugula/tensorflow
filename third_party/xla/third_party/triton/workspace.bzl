"""Provides the repository macro to import Triton."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")
load("//third_party/triton:llvm_integration/series.bzl", "llvm_patch_list")
load("//third_party/triton:temporary/series.bzl", "temporary_patch_list")

def repo():
    """Imports Triton."""

    TRITON_COMMIT = "triton_integrate_branch-"
    TRITON_SHA256 = "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
    tf_http_archive(
        name = "triton",
        sha256 = TRITON_SHA256,
        strip_prefix = "triton-" + TRITON_COMMIT,
        urls = tf_mirror_urls("https://github.com/openxla/triton/archive/{}.tar.gz".format(TRITON_COMMIT)),
        patch_file = llvm_patch_list + temporary_patch_list,
    )

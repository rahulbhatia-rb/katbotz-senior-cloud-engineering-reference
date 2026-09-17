import pathlib
import unittest

ROOT = pathlib.Path(__file__).parents[1] / "infra" / "main.tf"

class Controls(unittest.TestCase):
    def test_storage_is_encrypted_and_private(self):
        text = ROOT.read_text()
        self.assertIn('sse_algorithm = "aws:kms"', text)
        for setting in ("block_public_acls = true", "block_public_policy = true", "restrict_public_buckets = true"):
            self.assertIn(setting, text)

    def test_egress_is_limited_to_tls(self):
        self.assertIn('from_port = 443 to_port = 443 protocol = "tcp"', ROOT.read_text())

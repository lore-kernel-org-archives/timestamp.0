Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6070219516
	for <timestamp@lists.linux.dev>; Tue, 30 May 2023 14:49:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2af2e908163so49816481fa.2
        for <timestamp@lists.linux.dev>; Tue, 30 May 2023 07:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458156; x=1688050156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07SVfkqZ0qgipCgWqf2WUuDolS+hCGhbSje3XLty2Ao=;
        b=aPeYmCNt05cObjx95ndQCrOdKmC01qE9rKbj1E0y9u+++2RIcqlsWtlkGyGI2n1xbU
         AghcT3BWhigFLgjE4GPxSIys40q1Sl8bw+sC08K6jVCsHQe1FDuz+txGGgs4K7+tN9lv
         D+4p4yaduPEphpO5OXOqcpkPAhLrj3akuiJimPh+rPajTiJxAjHzij7o/Rb5N41Szij0
         Vfjo2jfGnHworYtyq2Bgw0ZYnG2uSy5rKuQvaYzL13g1eDccob4no3SUelsX3xA+WyXc
         Qeq3VqRPuVvPCLgdqEFa3pTldVfXGj5yH9H+3Chlgzhm00nwJTyVe701en4WhppjApJz
         aTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458156; x=1688050156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07SVfkqZ0qgipCgWqf2WUuDolS+hCGhbSje3XLty2Ao=;
        b=E/QPI2Yoswky6lt6IUOJnHhBH5Xe5sSSdlaW+BeLYfgjYWRNWRlfhlmmTY+Fx5n1KB
         MeOLhpfDiihdsOEK+UOWRTjcYel+IL7VIdGk0n0Hkt39VlGRctjmLhiJX1QUPMuTAtEN
         LZ1QL/NGtrbTKMAOWbdAHDdGrZJ9wR00JSEIN87GhdvyFuK999l2R3D/2O5gs8Ad57YS
         Bf6vf+b/F+Ig1YTSjCpDe9EB1qt0f/SzSOKB89UxRdKeTKnNY4TQBH2rcPAz7bc9OVFm
         V6qW9KHHPrLPpJz8j163LYo+/MLFyAwV1f/SwZxFPTSbpL5LMfp7pF72dQtPYxmXyJTp
         ZhRQ==
X-Gm-Message-State: AC+VfDxsjqPTozzAVsmdfabAhwFtreHCucbJBvl+KPb5kkhzO5jrCfDV
	wKBJ09DKuAdcTPByjQVP6LI4aw==
X-Google-Smtp-Source: ACHHUZ4eIHTpavdLEXQppq1HffGyODpAFKw+HJwL/rxKmW3KOl/YjNnJCyJOlMEXir4uXif/y/NFgw==
X-Received: by 2002:a2e:c42:0:b0:2ac:67f7:25a2 with SMTP id o2-20020a2e0c42000000b002ac67f725a2mr897767ljd.50.1685458156521;
        Tue, 30 May 2023 07:49:16 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 7/7] dt-bindings: watchdog: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:51 +0200
Message-Id: <20230530144851.92059-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to -N suffixes to decimal
numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/watchdog/watchdog.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
index 519b48889eb1..f0a584af1223 100644
--- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
@@ -17,11 +17,11 @@ description: |
 select:
   properties:
     $nodename:
-      pattern: "^watchdog(@.*|-[0-9a-f])?$"
+      pattern: "^watchdog(@.*|-([0-9]|[1-9][0-9]+))?$"
 
 properties:
   $nodename:
-    pattern: "^(timer|watchdog)(@.*|-[0-9a-f])?$"
+    pattern: "^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   timeout-sec:
     description:
-- 
2.34.1


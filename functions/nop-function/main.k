import models.io.upbound.customer.v1alpha1 as customerv1alpha1
import models.k8s.apimachinery.pkg.apis.meta.v1 as metav1
oxr = customerv1alpha1.XNoOp {**option("params").oxr}
_ocds = option("params").ocds # observed composed resources
_dxr = option("params").dxr # desired composite resource
dcds = option("params").dcds # desired composed resources

# Create a different resource type, not NoOp
_items = [
    {
        apiVersion = "nop.crossplane.io/v1alpha1",
        kind = "NopResource",
        metadata = {
            name = "my-nop-resource1",
            annotations = {
                "crossplane.io/composition-resource-name" = "my-nop-resource1"
            }
        },
        spec = {
            forProvider = {
                fields = {
                    ultimateQuestion = oxr.spec.parameters.ultimateQuestion
                },
                conditionAfter = [
                    {
                        time = "10s",
                        conditionType = "Ready",
                        conditionStatus = "True"
                    }
                ]
            },
            providerConfigRef = {
                name = "default"
            }
        }
    },
    {
        apiVersion = "nop.crossplane.io/v1alpha1",
        kind = "NopResource",
        metadata = {
            name = "my-nop-resource2",
            annotations = {
                "crossplane.io/composition-resource-name" = "my-nop-resource2"
            }
        },
        spec = {
            forProvider = {
                fields = {
                    ultimateAnswer = oxr.spec.parameters.ultimateAnswer
                },
                conditionAfter = [
                    {
                        time = "20s",
                        conditionType = "Ready",
                        conditionStatus = "True"
                    }
                ]
            },
            providerConfigRef = {
                name = "default"
            }
        }
    }
]

items = _items
